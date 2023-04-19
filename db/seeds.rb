# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'like@ekil',
   password: 'like01'
)

Customer.create!(
   [
      {
         email: 'q@q',
         name: 'ねこ',
         password: 'qqqqqq',
         profile: 'にゃん',
         image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/customer/neko.png'), filename: 'test.png')
      },
      {
         email: 'w@w',
         name: 'あひる',
         password: 'wwwwww',
         profile: 'があ',
         image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/customer/ahiru.png'), filename: 'test.png')
      },
      {
         email: 'e@e',
         name: 'きつね',
         password: 'eeeeee',
         profile: 'やーん',
         image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/customer/kitune.png'), filename: 'test.png')
      },
      {
         email: 'r@r',
         name: 'きりん',
         password: 'rrrrrr',
         profile: 'もー',
         image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/customer/kirin.png'), filename: 'test.png')
      },
      {
         email: 't@t',
         name: 'はしびろこう',
         password: 'tttttt',
         profile: 'くくくくくくくく',
         image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/customer/hashibirokou.png'), filename: 'test.png')
      }
   ]
)

tags = [
   Tag.create_or_find_by(tag_name: 'ねこ'),
   Tag.create_or_find_by(tag_name: '動物'),
   Tag.create_or_find_by(tag_name: 'かわいい'),
   Tag.create_or_find_by(tag_name: 'サイクリング'),
   Tag.create_or_find_by(tag_name: '小道'),
   Tag.create_or_find_by(tag_name: 'アウトドア'),
   Tag.create_or_find_by(tag_name: 'VR'),
   Tag.create_or_find_by(tag_name: 'ゲーム'),
   Tag.create_or_find_by(tag_name: 'アニメ'),
   Tag.create_or_find_by(tag_name: 'グッズ集め'),
   Tag.create_or_find_by(tag_name: 'キャンプ'),
   Tag.create_or_find_by(tag_name: 'ケトル'),
   Tag.create_or_find_by(tag_name: '音楽'),
   Tag.create_or_find_by(tag_name: 'ドライブ'),
   Tag.create_or_find_by(tag_name: '動画'),
   Tag.create_or_find_by(tag_name: 'カラオケ'),
]

likes = Like.create!(
   [
      {  # 0
         customer_id: 1,
         name: 'ねこの寝顔がカワイイ',
         introduction: '休日に飼い猫のみーちゃんと過ごしているとき、寝顔を見せてくれる時があるのですが、その瞬間がとてもかわいくて好きな時間です。',
         image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/post/neko-negao.jpg'), filename: 'test.png'),
      },
      {
         customer_id: 1,
         name: '春の小道をサイクリング！',
         introduction: 'いつも通学に使っている小道が大好きで、特に春の季節に通ると風が気持ち良く、お気に入りのスポットになっています。',
         image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/post/cycling.jpg'), filename: 'test.png'),
      },
      {
         customer_id: 2,
         name: 'VRにはまってます。',
         introduction: '最近、VR機器を購入してとりあえずゲームを楽しんでみたところ、没入感があり、とても楽しかったです。はまってしまったので、映画でも観てみたいと思っているのですが、VRで観るべきおすすめの作品を良ければ教えてください。',
         image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/post/vr.jpg'), filename: 'test.png'),
      },
      {
         customer_id: 2,
         name: '今日も今日とて、アニメのグッズをみる',
         introduction: '二か月に一度のペースで通っています。特によかったアニメのグッズを探すのが好きです。興味がある方、一緒に行きませんか。',
         image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/post/anime.jpg'), filename: 'test.png'),
      },
      {
         customer_id: 3,
         name: 'キャンプ行くならこれは欠かせない！好きな道具を紹介',
         introduction: 'キャンプに必須であるテントや折りたためる椅子並みに世界を変えてくれます。今日紹介したいのは、ケトルです。普段、ケトルでお湯を沸かし、コーヒーをたしなむなど一切してこなかった私ですが、キャンプにドはまりしてからはこのケトルで沸かしたお湯でいただくコーヒーが忘れられず、普段でもたまに使用してしまうくらいです（笑）',
         image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/post/kettle.jpg'), filename: 'test.png'),
      },
      {
         customer_id: 3,
         name: '歌いながらの運転がとても楽しい',
         introduction: '車を運転しているときって特に何もすることがなくて退屈ですよね。そんな時は好きな曲を流しながら歌ってます。',
         image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/post/car.jpg'), filename: 'test.png'),
      },
      {
         customer_id: 4,
         name: '動物の動画を観るのが好き！',
         introduction: '動物のおもしろ動画や生態についての解説を観るのが好き！普段見られないレアな瞬間を動画で観れるなんてとてもいい時代だと思う',
         image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/post/shika.jpg'), filename: 'test.png'),
      },
      {
         customer_id: 5,
         name: '仕事終わりのカラオケ',
         introduction: '週２ペースでカラオケします。金曜日の仕事終わりのカラオケが特に大好きで、金曜は絶対に通います。',
         image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/post/vocal.jpg'), filename: 'test.png'),
      }
   ]
)

likes[0].tags << tags[0]
likes[0].tags << tags[1]
likes[0].tags << tags[2]

likes[1].tags << tags[3]
likes[1].tags << tags[4]
likes[1].tags << tags[5]

likes[2].tags << tags[6]
likes[2].tags << tags[7]

likes[3].tags << tags[8]
likes[3].tags << tags[9]

likes[4].tags << tags[5]
likes[4].tags << tags[10]
likes[4].tags << tags[11]

likes[5].tags << tags[12]
likes[5].tags << tags[13]

likes[6].tags << tags[14]
likes[6].tags << tags[1]

likes[7].tags << tags[15]
likes[7].tags << tags[12]