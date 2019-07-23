# 一、概述

###### JavaScript 语言采用的是单线程模型，也就是说，所有任务只能在一个线程上完成，一次只能做一件事。前面的任务没做完，后面的任务只能等着。随着电脑计算能力的增强，尤其是多核 CPU 的出现，单线程带来很大的不便，无法充分发挥计算机的计算能力

###### Web Worker 的作用，就是为 JavaScript 创造多线程环境，允许主线程创建 Worker 线程，将一些任务分配给后者运行。在主线程运行的同时，Worker 线程在后台运行，两者互不干扰。等到 Worker 线程完成计算任务，再把结果返回给主线程。这样的好处是，一些计算密集型或高延迟的任务，被 Worker 线程负担了，主线程（通常负责 UI 交互）就会很流畅，不会被阻塞或拖慢。

###### Worker 线程一旦新建成功，就会始终运行，不会被主线程上的活动（比如用户点击按钮、提交表单）打断。这样有利于随时响应主线程的通信。但是，这也造成了 Worker 比较耗费资源，不应该过度使用，而且一旦使用完毕，就应该关闭。

> ###### *Web Worker 有以下几个使用注意点：

（1）**同源限制**

分配给 Worker 线程运行的脚本文件，必须与主线程的脚本文件同源。

（2）**DOM 限制**

Worker 线程所在的全局对象，与主线程不一样，无法读取主线程所在网页的 DOM 对象，也无法使用document、window、parent这些对象。但是，Worker 线程可以navigator对象和location对象。

（3）**通信联系**

Worker 线程和主线程不在同一个上下文环境，它们不能直接通信，必须通过消息完成。

（4）**脚本限制**

Worker 线程不能执行alert()方法和confirm()方法，但可以使用 XMLHttpRequest 对象发出 AJAX 请求。

（5）**文件限制**

Worker 线程无法读取本地文件，即不能打开本机的文件系统（file://），它所加载的脚本，必须来自网络。

# **二、基本用法**

**2.1 UI主线程**

  

```
    <input type="number" id="num"> <br><br>
    <button id="btn1">开始计算累加和...</button>

    <div id="result">
         准备计算中...
    </div>
    <script>
        var num = document.getElementById("num");
        var btn1 = document.getElementById("btn1");
        var result = document.getElementById("result");

​        btn1.onclick = function(){    //为按钮绑定点击事件
​            var n = num.value;        //获取用户输入值
​            var w = new Worker("js/05.js"); //创建Worker线程
​            w.postMessage(n);          //发送用户输入数值
​            w.onmessage = function(e){ //接收返回结果
​              console.log('worker线程已返回计算结果')
​              result.innerHTML =  e.data;
​            }
​        }
​    </script>
```

**结束方法：w.terminate()**

**2.2 worker线程**

```
onmessage = function(e){     console.log('worker 线程已收到数据开始计算');     var n = parseInt(e.data);     var sum = 0;     for(var i=1;i<=n;i++){         sum += i;     }     postMessage(sum); } 
```

**结束方法：close()或者self.close()**

**2.3 Worker 加载脚本**

Worker 内部如果要加载其他脚本，有一个专门的方法importScripts()

importScripts('script1.js'); 

该方法可以同时加载多个脚本。

importScripts('script1.js', 'script2.js'); 



**2.4 错误处理**

主线程可以监听 Worker 是否发生错误。如果发生错误，Worker 会触发主线程的error事件

worker.onerror(function (event) {   console.log([     'ERROR: Line ', e.lineno, ' in ', e.filename, ': ', e.message   ].join('')); });  // 或者 worker.addEventListener('error', function (event) {   // ... }); 

# **三、数据通信**

前面说过，主线程与 Worker 之间的通信内容，可以是文本，也可以是对象。需要注意的是，这种通信是拷贝关系，即是传值而不是传址，Worker 对通信内容的修改，不会影响到主线程。事实上，浏览器内部的运行机制是，先将通信内容串行化，然后把串行化后的字符串发给 Worker，后者再将它还原。

主线程与 Worker 之间也可以交换二进制数据，比如 File、Blob、ArrayBuffer 等类型，也可以在线程之间发送。下面是一个例子。

// 主线程 var uInt8Array = new Uint8Array(new ArrayBuffer(10)); for (var i = 0; i < uInt8Array.length; ++i) {   uInt8Array[i] = i * 2; // [0, 2, 4, 6, 8,...] } worker.postMessage(uInt8Array);  // Worker 线程 self.onmessage = function (e) {   var uInt8Array = e.data;   postMessage('Inside worker.js: uInt8Array.toString() = ' + uInt8Array.toString());   postMessage('Inside worker.js: uInt8Array.byteLength = ' + uInt8Array.byteLength); }; 

但是，拷贝方式发送二进制数据，会造成性能问题。比如，主线程向 Worker 发送一个 500MB 文件，默认情况下浏览器会生成一个原文件的拷贝。为了解决这个问题，JavaScript 允许主线程把二进制数据直接转移给子线程，但是一旦转移，主线程就无法再使用这些二进制数据了，这是为了防止出现多个线程同时修改数据的麻烦局面。这种转移数据的方法，叫做[Transferable Objects](http://www.w3.org/html/wg/drafts/html/master/infrastructure.html#transferable-objects)。这使得主线程可以快速把数据交给 Worker，对于影像处理、声音处理、3D 运算等就非常方便了，不会产生性能负担。

如果要直接转移数据的控制权，就要使用下面的写法。

// Transferable Objects 格式 worker.postMessage(arrayBuffer, [arrayBuffer]);  // 例子 var ab = new ArrayBuffer(1); worker.postMessage(ab, [ab]); 