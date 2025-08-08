from fastapi import FastAPI
import yfinance as yf

app=FastAPI()

@app.get('/download_ticker/{ticker}')

def download_ticker(ticker):
    data=yf.download(ticker)
    data.to_csv(f'data_{ticker}.csv')

    return 'success'



