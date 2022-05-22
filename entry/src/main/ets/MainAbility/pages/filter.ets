@Entry
@Component

struct filter {
  @State color : Color[] = [Color.Gray,Color.Blue];
  @State gender : number[] = [1,1,1];//male,female,both
  @State category : number[] = [1,1,1,1];//
  private brand_name : string[] = ['Adidas','Campus','Nike','SparX'];
  @State brand : boolean[] = [true,true,true,true];
  @State price : number[] = [0,10000];
  @State size : number[] = [1,1,1,1];//6,7,8,9 inches

  build() {
    Column({space:5}) {
      //heading
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Navigator({target:'pages/index',type:NavigationType.Back}){
          Text("<").fontSize(15).width(30).height(30).textAlign(TextAlign.Center).backgroundColor(0xcccccc).border({width:1}).borderRadius(10)
        }
        Text('Filters').fontStyle(FontStyle.Normal).fontSize(25).fontWeight(FontWeight.Bold).width(80).height(40).backgroundColor(Color.White)
        Text("o o").fontSize(10).width(30).height(30).textAlign(TextAlign.Center).backgroundColor(0xcccccc).border({width:1}).borderRadius(10).onClick(() => {
          AlertDialog.show({ message: "Info about Filters" });
        })

      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' }).width('97%')


      //Gender
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Text("Gender").textAlign(TextAlign.Start).fontSize(20)
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' })

      //Gender filters
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceEvenly }) {
        Button('Male',{type:ButtonType.Capsule}).width(80).height(40).fontSize(12).backgroundColor(this.color[this.gender[0]]).margin({left:10,right:10}).onClick(() => {
          this.gender[0] = ( this.gender[0] + 1) % 2;
          if(this.gender[0] + this.gender[1] == 2){
            this.gender[2] = 1;
          }
          else{
            this.gender[2] = 0;
          }
        })
        Button('Female',{type:ButtonType.Capsule}).width(80).height(40).fontSize(12).backgroundColor(this.color[this.gender[1]]).margin({left:10,right:10}).onClick(() => {
          this.gender[1] = ( this.gender[1] + 1) % 2;
          if(this.gender[0] + this.gender[1] == 2){
            this.gender[2] = 1;
          }
          else{
            this.gender[2] = 0;
          }
        })
        Button('Both',{type:ButtonType.Capsule}).width(80).height(40).fontSize(12).backgroundColor(this.color[this.gender[2]]).margin({left:10,right:10}).onClick(() => {
          this.gender[0] = 1;
          this.gender[1] = 1;
          this.gender[2] = 1;

        })
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' })


      //Category
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Text("Category").textAlign(TextAlign.Start).fontSize(20)
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' })

      //Cat Filters
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Column({space:5}) {
          ForEach(this.brand_name, (item) => {
            Flex({direction:FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween}) {
              Text(item).fontSize(20).alignSelf(ItemAlign.Center)
              Toggle({ isOn:true, type: ToggleType.Checkbox}).width(20).height(20).onChange(()=>{
                this.brand[this.brand_name.findIndex(item)] = !this.brand[this.brand_name.findIndex(item)]
              });
            }
          });
        }
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' }).width('85%')


      //Price
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Text("Price").textAlign(TextAlign.Start).fontSize(20)
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' })

      //Price Filters
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Slider({value:10000,style:SliderStyle.OutSet,min:500,max:10000,step:50,reverse:false,direction:Axis.Horizontal}).border({width:1}).borderRadius(10)
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' })


      //Size
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Text("Size").textAlign(TextAlign.Start).fontSize(20)
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' })

      //Size Filters
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Button('6 inches',{type:ButtonType.Capsule}).width(70).height(40).fontSize(10).backgroundColor(this.color[this.size[0]]).margin({left:10,right:10}).onClick(() => {
          this.size[0] = ( this.size[0] + 1) % 2;
        })
        Button('7 inches',{type:ButtonType.Capsule}).width(70).height(40).fontSize(10).backgroundColor(this.color[this.size[1]]).margin({left:10,right:10}).onClick(() => {
          this.size[1] = ( this.size[1] + 1) % 2;
        })
        Button('8 inches',{type:ButtonType.Capsule}).width(70).height(40).fontSize(10).backgroundColor(this.color[this.size[2]]).margin({left:10,right:10}).onClick(() => {
          this.size[2] = ( this.size[2] + 1) % 2;
        })
        Button('9 inches',{type:ButtonType.Capsule}).width(70).height(40).fontSize(10).backgroundColor(this.color[this.size[3]]).margin({left:10,right:10}).onClick(() => {
          this.size[3] = ( this.size[3] + 1) % 2;
        })
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' })


      //Clear and Add buttons
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Button('Clear All',{type:ButtonType.Normal}).width(120).height(100).fontSize(20).margin({left:10,right:10}).padding(10).borderRadius(10).margin({left:30}).backgroundColor(Color.Grey)
          .onClick(() => {
            this.gender = [1,1,1];
            this.brand = [true,true,true,true];
            this.size = [1,1,1,1];
            this.price = [0,10000];
          })
        Navigator({target:'pages/index',type:NavigationType.Back}){
          Button('Add',{type:ButtonType.Normal}).width(120).height(100).fontSize(20).margin({left:10,right:10}).padding(10).borderRadius(10).margin({right:30}).backgroundColor(Color.Blue)
        }

      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' })
    }
  }
}