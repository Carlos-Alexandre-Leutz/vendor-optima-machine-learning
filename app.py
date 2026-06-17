import os
import pandas as pd
from flask import Flask, request, jsonify
from flask_cors import CORS, cross_origin
from sqlalchemy import create_engine, text
from sklearn.linear_model import LinearRegression
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)

CORS(app, resources={r"/*": {"origins": "*", "allow_headers": "*", "methods": ["POST", "GET", "OPTIONS"]}})

DATABASE_URL = os.getenv("DATABASE_URL")

if not DATABASE_URL:
    raise RuntimeError(
        "❌ ERRO CRÍTICO: A variável de ambiente DATABASE_URL não foi definida! "
        "Verifique o seu arquivo .env local ou as configurações do Render."
    )

engine = create_engine(DATABASE_URL)
try:
    with engine.connect() as conn:
        tabela_existe = conn.execute(text("SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'fornecedores');")).scalar()

        if not tabela_existe:

            sql_path = os.path.join(os.path.dirname(__file__), 'init-db', '01-init.sql')

            with open(sql_path, 'r', encoding='utf-8') as f:
                sql_script = f.read()

            conn.execute(text(sql_script))
            conn.commit()

except Exception as e:
    print(f"⚠️ Alerta ao carregar o script de inicialização: {e}")

@app.route('/prever-custo', methods=['POST', 'OPTIONS'])
@cross_origin()
def prever_custo():
    if request.method == 'OPTIONS':
        return jsonify({"status": "OK"}), 200

    try:
        df_banco = pd.read_sql("SELECT * FROM fornecedores", engine)

        df_banco = df_banco.rename(columns={
            'fornecedor': 'Fornecedor',
            'preco_historico': 'Média_Preço_Histórico (R$)',
            'nota_qualidade': 'Nota_Qualidade_Histórica',
            'media_atraso_dias': 'Média_Atraso_Dias',
            'media_refacoes': 'Média_Refações_Históricas'
        })

        CUSTO_HORA_FTD = 50
        df_banco['Tempo_Desperdiçado_Real_Horas'] = (df_banco['Média_Refações_Históricas'] * 8) + (df_banco['Média_Atraso_Dias'] * 4)
        df_banco['Custo_Real_Histórico_Alvo'] = df_banco['Média_Preço_Histórico (R$)'] + (df_banco['Tempo_Desperdiçado_Real_Horas'] * CUSTO_HORA_FTD)

        X = df_banco[['Média_Preço_Histórico (R$)', 'Média_Atraso_Dias', 'Média_Refações_Históricas']]
        y = df_banco['Custo_Real_Histórico_Alvo']

        modelo_ia = LinearRegression()
        modelo_ia.fit(X, y)

        df_banco['Custo_Real_Previsto_IA'] = modelo_ia.predict(X)
        df_banco['Score_Eficiência_IA'] = (df_banco['Nota_Qualidade_Histórica'] * 10000) / df_banco['Custo_Real_Previsto_IA']

        df_ranking = df_banco.sort_values(by='Score_Eficiência_IA', ascending=False).reset_index(drop=True)

        top_10 = df_ranking.head(10)
        resultado_lista = []

        for _, row in top_10.iterrows():
            resultado_lista.append({
                "fornecedor": str(row['Fornecedor']),
                "preco_historico": float(row['Média_Preço_Histórico (R$)']),
                "nota_qualidade": float(row['Nota_Qualidade_Histórica']),
                "custo_real": float(row['Custo_Real_Previsto_IA']),
                "score_eficiencia": float(row['Score_Eficiência_IA'])
            })

        return jsonify({"fornecedores_top_10": resultado_lista}), 200

    except Exception as e:
        response = jsonify({"erro_interno_python": str(e)})
        return response, 500

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True)