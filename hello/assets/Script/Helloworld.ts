const {ccclass, property} = cc._decorator;

@ccclass
export default class Helloworld extends cc.Component {

    @property(cc.Label)
    label: cc.Label = null;

    @property
    text: string = 'hello';
    onLoad(){
        //注册全局类
        window['Helloworld'] = this;
    }

    start () {
        // init logic
        this.label.string = this.text;
        sendWord("aaa");
    }

    public getMsg(msg:string){
        this.label.string = msg;
    }
}
