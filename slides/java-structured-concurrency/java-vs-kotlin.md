---
---
# What about Kotlin?

## Java 

```java {maxHeight:'50px'}
    public Order getOrder(String orderId) throws InterruptedException {
        try (var scope = new StructuredTaskScope<Order>()) {
            Subtask<Order> subtask = scope.fork(() -> orderClient.getOrder(orderId));
            scope.join();
            return subtask.get();
        }
    }
```

## Kotlin

```kotlin {maxHeight:'50px'}

suspend fun getOrder(orderId: String): Order =
    supervisorScope {
        val deferred = async(Dispatchers.IO) {
            orderClient.getOrder(orderId)
        }
        try {
            deferred.await()
        } catch (e: Exception) {
            // Handle exception
        }
    }
```

---
---
# Kotlin with Virtual Threads

```kotlin
val virtualThreadDispatcher = 
    Executors.newVirtualThreadPerTaskExecutor()
        .asCoroutineDispatcher()

suspend fun myNiceAsynchronousCode() {
    withContext(virtualThreadDispatcher) {
        existingAndComplexBlockingCode()
    }
}
```