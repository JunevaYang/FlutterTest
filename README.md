# FlutterTest
制作flutter登录界面及个人信息页    

![avatar](./toolmanager/Login.jpg)

![avatar](./toolmanager/MyInfo.png)
### 问题
#### checkbox
使用CheckboxListTile的话，选框与文字之间会有较大的间隙，所以采用checkbox加Text组合，   
再为Text添加点击事件，与checkbox绑定   

#### tab栏的子页面 
含有tab栏的子页面，如果使用Container添加背景的话，两侧会出现白边，   
解决： 给image添加属性 fit:BoxFit.cover
