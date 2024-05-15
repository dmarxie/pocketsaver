
class IntroContent{
  String title;
  String images;
  String description;

  IntroContent({this.title = '', this.images = '', this.description = ''});
}

List<IntroContent> contents = [
   IntroContent(
    title: 'Welcome to Pocketsaver!',
    images: 'assets/images/Saver.png',
    description: "Track your expenses effortlessly with PocketSaver, your user-friendly budget companion",
  ),
   IntroContent(
    title: 'Simple and Powerful',
    images: 'assets/images/Saver2.png',
    description: "PocketSaver simplifies expense tracking with its easy-to-use interface.",
  ),
   IntroContent(
    title: 'Real-time Insights and Alerts',
    images: 'assets/images/Saver3.png',
    description: "Get real-time insights into your financial standing and receive alerts as you approach your budget limit.",
  )



];
 
