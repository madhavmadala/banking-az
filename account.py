class BankAccount:
    def __init__(self, owner: str, balance: float = 0.0):
        self.owner = owner
        self.balance = balance

    def deposit(self, amount: float) -> float:
        if amount <= 0:
            raise ValueError("Deposit amount must be positive.")
        self.balance += amount
        return self.balance

    def withdraw(self, amount: float) -> float:
        if amount > self.balance:
            raise ValueError("Insufficient funds.")
        self.balance -= amount
        return self.balance


if __name__ == "__main__":
    acc = BankAccount("Madhav", 1000.0)
    print(f"Initial balance for {acc.owner}: ${acc.balance:.2f}")
    acc.deposit(500.0)
    print(f"After deposit: ${acc.balance:.2f}")