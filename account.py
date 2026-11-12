class BankAccount:
    def __init__(self, owner: str, balance: float = 0.0):
        self.owner = owner
        self.balance = balance
        self.transactions: list[str] = []
        if balance > 0:
            self.transactions.append(f"Opened account with ${balance:.2f}")

    def deposit(self, amount: float) -> float:
        if amount <= 0:
            raise ValueError("Deposit amount must be positive.")
        self.balance += amount
        self.transactions.append(f"Deposited ${amount:.2f}")
        return self.balance

    def withdraw(self, amount: float) -> float:
        if amount > self.balance:
            raise ValueError("Insufficient funds.")
        self.balance -= amount
        self.transactions.append(f"Withdrew -${amount:.2f}")
        return self.balance

    def print_statement(self) -> None:
        print(f"\n--- Statement for {self.owner} ---")
        for entry in self.transactions:
            print(entry)
        print(f"Current Balance: ${self.balance:.2f}")

if __name__ == "__main__":
    acc = BankAccount("Madhav", 3000.0)
    acc.deposit(1000.0)
    acc.withdraw(200.0)
    acc.print_statement()