@Entry
@Component
struct Page {
  @State price: number = 1500;
  @State name: string = "Name";
  @State desc: string = `This is about the product we are displaying. It's an awesome product available in many colours and sizes.`
  @State color:Color = Color.White;
  @State quantity: number = 0;

  build() {
    Column({space:5}) {
      //heading
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Navigator({target:'pages/index',type:NavigationType.Back}){
          Text("<").fontSize(15).width(30).height(30).textAlign(TextAlign.Center).backgroundColor(0xcccccc).border({width:1}).borderRadius(10)
        }
        Text('Detail').fontStyle(FontStyle.Normal).fontSize(25).fontWeight(FontWeight.Bold).width(80).height(40).backgroundColor(Color.White)
        Text("o o").fontSize(10).width(30).height(30).textAlign(TextAlign.Center).backgroundColor(0xcccccc).border({width:1}).borderRadius(10).onClick(() => {
          AlertDialog.show({ message: "This Page shows the details of the product" });
        })
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' }).width('97%')

      //image
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }){
        Stack({alignContent:Alignment.BottomEnd}){
          Image($r('app.media.icon')).width(350).height(350);
          RateBar({n_raters:200,rating:4.5})
          }
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' }).width('97%')

      //Name and Price
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }){
        Text(this.name).fontSize(25).fontWeight(FontWeight.Bold)
        Text('INR ' + this.price).fontSize(15).fontWeight(FontWeight.Bold)
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' }).width('95%').height(60)

      //About
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }){
        Text(this.desc).fontSize(15).fontWeight(FontWeight.Regular).fontColor(0x555555).maxLines(3)
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' }).width('85%')

      //Color and Counter
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceEvenly }){
        Text('Color').fontSize(20).fontWeight(FontWeight.Bold)
        Button({type:ButtonType.Circle}).backgroundColor(Color.White).border({width:10,radius:20,color:Color.Blue}).size({width:15,height:15}).onClick(()=>{
          this.color = Color.Blue;
          AlertDialog.show({message: 'Blue is selected'});
        });
        Button({type:ButtonType.Circle}).backgroundColor(Color.White).border({width:10,radius:20,color:Color.Yellow}).size({width:15,height:15}).onClick(()=>{
          this.color = Color.Yellow;
          AlertDialog.show({message: 'Yellow is selected'});
        });
        Button({type:ButtonType.Circle}).backgroundColor(Color.White).border({width:10,radius:20,color:Color.Red}).size({width:15,height:15}).onClick(()=>{
          this.color = Color.Red;
          AlertDialog.show({message: 'Red is selected'});
        });
        CustomCounter({qty:$quantity})
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' }).width('95%')

      //Favourite and Add to cart
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceEvenly }){
        Image($r('app.media.icon')).width(30).height(30).onClick(()=>{
          AlertDialog.show({message:'Added to favourites'})
        });
        Button({type:ButtonType.Normal}){
          Row(){
            Text('Add to Cart  ').fontSize(20).fontColor(Color.White).fontWeight(FontWeight.Bolder);
            Image($r('app.media.icon')).width(30).height(30);
          }
        }.width(250).height(60).border({width:5,radius:15,color:Color.Blue}).backgroundColor(Color.Blue).onClick(()=>{
          AlertDialog.show({message:'Added to Cart'});
        })
      }.margin({ top: '25px', left: '25px', right: '25px', bottom: '15px' }).width('95%')

    }
  }
}

@Component
struct RateBar {
  @Prop rating: number;
  @Prop n_raters: number;
  build(){
    Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center,justifyContent:FlexAlign.SpaceEvenly}){
      Row() {
        Image($r('app.media.icon')).width(40).height(40).padding(10)
        Text(this.rating.toString()).width(40).height(60).fontWeight(FontWeight.Bold).fontSize(30).fontColor(Color.White)
      }.width(100)
      Text('   '+this.n_raters + ' reviews').width(100).height(40).fontColor(Color.White).fontSize(14)
    }.height(100).padding(5).borderRadius(5).borderColor(Color.White).borderWidth(5).backgroundColor(0x333333).borderRadius(35)
  }
}

@Component
struct CustomCounter {
  @Link qty:number;
  build() {
    Row({space:3}){
      Button('+',{type:ButtonType.Normal}).size({width:45,height:45}).backgroundColor(Color.Blue).fontColor(Color.White).fontSize(20).fontWeight(FontWeight.Bolder).onClick(()=>{this.qty++;})
      Text(this.qty.toString()).fontSize(20).width(30).height(30).borderWidth(5).borderRadius(5).borderColor(Color.Blue).fontColor(Color.White)
      Button('-',{type:ButtonType.Normal}).size({width:40,height:40}).backgroundColor(Color.Blue).fontColor(Color.White).fontSize(25).fontWeight(FontWeight.Bolder).onClick(()=>{
        this.qty--;
        if (this.qty<0) {
          this.qty = 0;
        }
      })
   }.border({width:5,radius:20,color:Color.Blue}).backgroundColor(Color.Blue).width(130).height(50)
  }
}