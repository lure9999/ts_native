# ts_native
cocoscreator ts项目与IOS/Android 交互

项目描述

原生webview加载cocoscreator ts 的游戏页面。经常使用的场景调用原生的sdk之类的。

1.业务流程

ts发起调用原生方法，原生处理完数据 在回调给ts 使用。



2.技术实现流程

ts->js->native->js->ts

3.ts要想使用js

js要先定义d.ts 这个没啥说的 都是参考。注意要将js导入为插件。
4js调用原生

js调用native webview的代理方法 发送消息

if(deviceType==1){

        //ios

         window.webkit.messageHandlers.JumpToParentCenter.postMessage(JSON.stringify(msg));

    }else{

        //android

        leiming.fangfaming(JSON.stringify(msg));

    }

5.原生webview收到消息进行业务处理 发送消息给js

    [wkwebViewevaluateJavaScript:@"revMsg('bbbb')"completionHandler:^(id_Nullableresponse,NSError*_Nullableerror) {

           NSLog(@"error %@", error);

       }];

6.js收到消息 给ts发送消息。

这里要用到window定义一个全局的类

在你需要使用回调的ts类里定义。window['需要数据回调的类'] = this

然后js 直接调用 window['需要数据回调的类'] .方法（）；
7.ts收到js给的消息 完成业务。
