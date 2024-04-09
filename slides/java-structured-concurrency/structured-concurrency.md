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

<div v-click> </div>
<div v-click> </div>
<div v-click> </div>

<!--
A Completable Future then allows you to switch from one task to the other when it's blocking, within the same platform thread because platform threads are expensive.
Using though virtual threads, blocking calls are cheap, so using them are just fine and dandy. 
But you might end up with millions of them.
That's when Structured Concurrency comes to play. Launching virtual threads with a scope, bringing subtasks to it in a form of callable, and executing them in a virtual thread, brings visibility and context when debugging.

[click] Now what is the two main differences between using StructuredTaskScopes and the Executor services to create Virtual Threads. 
[click] The executor service has the same lifecycle as your application, meaning, they get created on startup and destroyed when application ends, because they also hold platform threads. While scopes are just a launcher of virtual threads. So once it's done, you close it, and garbage collect it.
[click] The second difference is that an executor holds a single queue, meaning, tasks will come out as a FIFO, one at a time. Scope, on the other hand, is built on a fork-join-pool. Meaning, it can steal threads whenever they become available.
-->

---
---
# Demo Time
