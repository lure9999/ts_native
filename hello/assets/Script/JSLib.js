//给native发消息
function sendWord(msg) {
    //alert(msg);
    cc.log("send:"+msg);
    //调用原生JumpToParentCenter  ios给你的名称
    //1ios 其他android
    var deviceType = 1 ;
    if(deviceType==1){
        window.webkit.messageHandlers.JumpToParentCenter.postMessage(JSON.stringify(msg));
    }else{
        leiming.fangfaming(JSON.stringify(msg));
    }
   

}

//h5收到native的消息
function revMsg(msg){
    //调用ts的方法
   cc.log("rev:"+msg)
   //调用全局类
   window['Helloworld'].getMsg(msg);
}

//


// function getCookie(cname) {
//     var name = cname + "=";
//     var ca = document.cookie.split(';');
//     for (var i = 0; i < ca.length; i++) {
//         var c = ca[i];
//         while (c.charAt(0) == ' ') c = c.substring(1);
//         if (c.indexOf(name) != -1) {
//             return c.substring(name.length, c.length);
//         }
//     }
//     return "";
// }


// function getAndroidFinishActivity(msg) {
//     SudokuWebActivity.JSFinishActivity(JSON.stringify(msg));
// }

// function getIOSFinishActivity(msg) {
//     //JumpToParentCenter 需要更换.
//   window.webkit.messageHandlers.JumpToParentCenter.postMessage(JSON.stringify(msg));
// }

