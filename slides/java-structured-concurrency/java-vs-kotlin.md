---
layout: two-cols
---
# Java 
```java
    public Order getOrder(String orderId) throws InterruptedException {
        try (var scope = new StructuredTaskScope<Order>()) {
            Subtask<Order> subtask = scope.fork(() -> orderClient.getOrder(orderId));
            scope.join();
            return subtask.get();
        }
    }
```
::right::
# Kotlin

```kotlin

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