# 📈 QuantStream: C++ Algorithmic Trading Backtester

QuantStream is a lightweight, high-speed backtesting engine designed for quantitative traders. Built with a **C++ backend**, it processes historical market data to simulate complex strategies while providing deep statistical insights like market memory (Hurst) and optimal position sizing (Kelly).



## ⚡ Core Features
* **High-Performance Engine:** Leverages C++17 for rapid data crunching and minimal latency.
* **Quantitative Analytics:**
    * **Hurst Exponent:** Determines if a market is trending ($H > 0.5$), mean-reverting ($H < 0.5$), or random walk ($H = 0.5$).
    * **Kelly Criterion:** Calculates the mathematically optimal risk fraction to maximize logarithmic growth.
* **Modern Web UI:** A dark-themed, responsive dashboard with **Chart.js** integration for Portfolio vs. Asset visualization.
* **Multi-Strategy Support:** SMA Crossover, Bollinger Bands, RSI Momentum, and Z-Score Arbitrage.

## 🛠️ Tech Stack
* **Backend:** C++17, `cpp-httplib` (Multithreaded Server)
* **Frontend:** HTML5, CSS3 (Custom Variables), JavaScript (ES6), Chart.js
* **Data:** JSON-based REST API
* **DevOps:** Docker (Multi-stage builds), Render/Linux deployment

## 📊 Mathematical Foundation

### The Kelly Fraction ($f^*$)
The engine uses the Kelly Criterion to solve for the optimal bet size:
$$f^* = \frac{bp - q}{b}$$
Where $p$ is the win rate and $b$ is the payoff ratio. This ensures the backtest accounts for the "volatility tax" during compounding.



### The Hurst Exponent ($H$)
Used to identify the "regime" of the asset (e.g., Adani Ports):
* **$H < 0.5$**: Mean Reverting (Buy low, sell high)
* **$H > 0.5$**: Persistent (Trend following)

## 🚀 Installation & Local Setup

1. **Clone the Project**
   ```bash
   git clone [https://github.com/YOUR_USERNAME/QuantStream.git](https://github.com/YOUR_USERNAME/QuantStream.git)
   cd QuantStream
