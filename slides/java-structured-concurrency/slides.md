---
theme: apple-basic
colorSchema: dark
transition: slide-left
highlighter: shiki
lineNumbers: false
mdc: true
title: What's Structured Concurrency in Java
themeConfig:
  paginationX: r
  paginationY: t
  paginationPagesDisabled: [1,2]
layout: intro-image
image: https://images.unsplash.com/photo-1506619216599-9d16d0903dfd?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb 
---

<div class="absolute top-10 left-30px" style="color:brown;">
  <h1>Please standby...</h1>
  <p> 

  *Meanwhile, get yourself something to drink* 
  
  </p>
</div>

---
layout: intro-image
image: https://images.unsplash.com/photo-1506619216599-9d16d0903dfd?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb 
---

<div class="absolute bottom-5 left-30px" style="color:gray;">
  <span class="font-500">

[JUG Ingolstadt](https://jug-in.bayern/)  04.2024\
  v0.0.1\
 @masagu (Maria Salcedo)

</span>
</div>

<div class="absolute top-10 left-30px" style="color:brown;">
  <h1>Structured Concurrency</h1>
  <p><logos-java />Java - JEP 462</p>
</div>


<div class="absolute right-30px bottom-30px">
  <a href="https://github.com/mariasalcedo/talks.masagu.dev" target="_blank" alt="GitHub" title="Open in GitHub"
    class="text-xl slidev-icon-btn opacity-50 !border-none !hover:text-black">
    <carbon-logo-github />
  </a>
</div>

<!--
Welcome! Today we will talk about project loom's proposal to Structured Concurrency.
Worth mentioning it is a preview API, meaning that, it is a well defined feature, yet not 100% permanent feature.
Therefore you won't find it activated unless you enable it through the JVM options on startup.
-->
---
src: ../../core-pages/intro.md
---

---
src: virtual-threads.md
---

---
src: structured-concurrency.md
---

---
src: java-vs-kotlin.md
---

---
src: content.md
---

---
src: glossary.md
---

---
src: ../../core-pages/outro.md
---

