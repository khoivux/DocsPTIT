import numpy as np

# Hàm Gradient Descent
def gradient_descent(X, y, learning_rate=0.01, iterations=1000):
    m, n = X.shape
    weights = np.zeros(n)
    bias = 0
    cost_history = []
    for _ in range(iterations):
        y_pred = np.dot(X, weights) + bias
        error = y_pred - y
        dw = (1/m) * np.dot(X.T, error)
        db = (1/m) * np.sum(error)
        weights -= learning_rate * dw
        bias -= learning_rate * db
        cost = (1/(2*m)) * np.sum(error**2)
        cost_history.append(cost)
    return weights, bias, cost_history

# Custom Linear Regression
class CustomLinearRegression:
    def __init__(self, learning_rate=0.01, iterations=1000):
        self.learning_rate = learning_rate
        self.iterations = iterations
        self.weights = None
        self.bias = None
    def fit(self, X, y):
        X = np.array(X)
        y = np.array(y)
        self.weights, self.bias, _ = gradient_descent(X, y, self.learning_rate, self.iterations)
    def predict(self, X):
        X = np.array(X)
        return np.dot(X, self.weights) + self.bias
    def score(self, X, y):
        y_pred = self.predict(X)
        ss_tot = np.sum((y - np.mean(y))**2)
        ss_res = np.sum((y - y_pred)**2)
        return 1 - ss_res / ss_tot