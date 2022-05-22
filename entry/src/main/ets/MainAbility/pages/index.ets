@Entry
@Component
struct Index {

  @State color: Color[] = [Color.Gray,Color.Blue];
  @State shoes_n: number = 1;
  @State devices_n: number = 0;
  @State fashion_n: number = 0;
  @State grocery_n: number = 0;
  @State product1:string[] = ['Running Unisex Shoes','Edition 1','1400'];
  @State product2:string[] = ['Running Unisex Shoes','Edition 3','2200'];
  scroller:Scroller = new Scroller();

  build() {
    Column(){
      Scroll(this.scroller){
        Column() {
          //app icon and user profile access
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
            Image($r('app.media.icon'))
              .width('100px')
              .height('100px')
              .onClick(() => {
                AlertDialog.show({ message: "Menu Opened" })
              })
            Image($r('app.media.icon'))
              .width('100px')
              .height('100px')
              .onClick(() => {
                AlertDialog.show({ message: "User Details" })
              })

          }
          .margin({ top: '15px', left: '15px', right: '15px', bottom: '15px' })


          //discover new items
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
            Text("Discover our latest Additions")
              .fontColor(Color.Black)
              .fontSize(25)
              .width(400)
              .height(100)
              .fontWeight(FontWeight.Bolder)
              .backgroundColor(Color.White)
              .borderRadius('20')

          }
          .margin({ top: '15px', left: '15px', right: '15px', bottom: '15px' })


          //search bar and filter button
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
            Row() {
              Search({value:'Search...'}).align(Alignment.Start).backgroundColor(0xcdcdcd).height(50).width(275)
              Navigator({target: 'pages/filter',type:NavigationType.Push}){
                Button('Filters').width(80).height(50).fontSize(15)
              }
            }


          }
          .margin({ top: '15px', left: '15px', right: '15px', bottom: '15px' })

          //notif for new additions
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
            Image($r('app.media.icon')).width(70).height(70)
            Column() {
              Text("Running Unisex          Shoes").width(120).height(35).fontSize(12).fontColor(Color.Black)
              Text("Coming Soon..").width(120).height(35).fontSize(15).fontColor(Color.Red)
            }.padding(10)
            Column() {
              Toggle({ type:ToggleType.Switch})
              Text('notify me').fontSize(10)
            }
          }.borderRadius(10).borderColor(Color.Grey)
          .margin({ top: '15px', left: '15px', right: '15px', bottom: '15px' })


          //categories
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
            Text("Categories").width(100).height(30).fontSize(20).fontColor(Color.Black)
          }
          .margin({ top: '15px', left: '15px', right: '15px', bottom: '15px' })


          //category list
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
            Button('Shoes',{type:ButtonType.Capsule,stateEffect:true}).width(80).fontSize(11).backgroundColor(this.color[this.shoes_n]).onClick(() => {
              this.shoes_n = (this.shoes_n + 1)%2;
            })
            Button('Devices',{type:ButtonType.Capsule,stateEffect:true}).width(80).fontSize(11).backgroundColor(this.color[this.devices_n]).onClick(() => {
              this.devices_n = (this.devices_n + 1)%2;
            })
            Button('Fashion',{type:ButtonType.Capsule,stateEffect:true}).width(80).fontSize(11).backgroundColor(this.color[this.fashion_n]).onClick(() => {
              this.fashion_n = (this.fashion_n + 1)%2;
            })
            Button('Grocery',{ type:ButtonType.Capsule,stateEffect:true}).width(80).fontSize(11).backgroundColor(this.color[this.grocery_n]).onClick(() => {
              this.grocery_n = (this.grocery_n + 1)%2;
            })
          }
          .margin({ top: '15px', left: '15px', right: '15px', bottom: '15px' })

          //Popular shoes
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
            Text("Popular Shoes").width(100).height(30).fontSize(15).fontColor(Color.Black)
            Text('View All >').fontSize(11)
          }
          .margin({ top: '15px', left: '15px', right: '15px', bottom: '15px' })

          //Product view
          Row({space: 10}) {
            Navigator({target:'pages/details',type:NavigationType.Push}){
              Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center,justifyContent:FlexAlign.SpaceEvenly}){
                Image($r('app.media.icon')).width(90).height(150)
                Text(this.product1[0]);
                Text(this.product1[1]);
                Text('INR ' + this.product1[2]);
              }.width(150).height(250).border({width:1,radius:30,color:0x89cfcd}).backgroundColor(0x89cfcd)
            }

            Navigator({target:'pages/details',type:NavigationType.Push}){
              Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center,justifyContent:FlexAlign.SpaceEvenly}){
                Image($r('app.media.icon')).width(90).height(150)
                Text(this.product1[0]);
                Text(this.product1[1]);
                Text('INR ' + this.product1[2]);
              }.width(150).height(250).border({width:1,radius:30,color:0x89cfcd}).backgroundColor(0x89cfcd)
            }

          }
          }
      }.scrollable(ScrollDirection.Vertical).scrollBar(BarState.On).scrollBarWidth(Color.Gray).scrollBarWidth(30)
      .onScroll((xOffset:number,yOffset:number)=>{
        console.info(xOffset + ' ' + yOffset)
      })

      Divider()

      Flex({direction:FlexDirection.Row,alignItems:ItemAlign.Center,justifyContent:FlexAlign.SpaceEvenly}){
        Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center,justifyContent:FlexAlign.SpaceEvenly}){
          Image($r('app.media.icon')).width(20).height(20)
          Text('Home').fontWeight(FontWeight.Bold).fontSize(13)
        }.backgroundColor(Color.White).width(70).height(50)

        Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center,justifyContent:FlexAlign.SpaceEvenly}){
          Image($r('app.media.icon')).width(20).height(20)
          Text('Categories').fontWeight(FontWeight.Bold).fontSize(13).fontColor(0x888888)
        }.backgroundColor(Color.White).width(70).height(50)

        Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center,justifyContent:FlexAlign.SpaceEvenly}){
          Image($r('app.media.icon')).width(20).height(20)
          Text('Notifications').fontWeight(FontWeight.Bold).fontSize(13).fontColor(0x888888)
        }.backgroundColor(Color.White).width(70).height(50)

        Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center,justifyContent:FlexAlign.SpaceEvenly}){
          Image($r('app.media.icon')).width(20).height(20)
          Text('My Cart').fontWeight(FontWeight.Bold).fontSize(13).fontColor(0x888888)
        }.backgroundColor(Color.White).width(70).height(50)

      }.margin({top:30})
    }
  }
}


