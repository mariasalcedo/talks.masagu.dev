---

---
# Syntax


## Structured Concurrency
```java
public Order getOrder(String orderId) throws InterruptedException {
    try (var scope = new StructuredTaskScope<Order>()) {
        Subtask<Order> subtask = scope.fork(() -> OrderClient.getOrder(orderId));
        scope.join();
        return subtask.get();
    }
}
```

## Classic Platform Threads

```java
public CompletableFuture<Order> getOrderAsyncFor(String orderId) {
    return CompletableFuture
            .completedFuture(orderId)
            .thenApplyAsync(x -> OrderClient.getOrder(x))
            .exceptionally(exception -> doSomethingWith(exception));
}
```

---
---
# Demo Time
