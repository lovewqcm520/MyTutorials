package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * 来自官方文档的说明.
	 * 
	 * 若要修改位图的外观，可以使用 noise() 方法或 perlinNoise() 方法对位图应用杂点效果。可以把杂点效果比作未调谐的电视屏幕的静态外观。
		若要对位图应用杂点效果，请使用 noise() 方法。此方法对位图图像的指定区域中的像素应用随机颜色值。
		此方法接受五个参数：

		public function noise(randomSeed:int, low:uint = 0, high:uint = 255, channelOptions:uint = 7, grayScale:Boolean = false):void
	
		randomSeed (int)：决定图案的随机种子数。不管名称具有什么样的含义，只要传递的数字相同，此数字就会生成相同的结果。为了获得真正的随机结果，请使用 Math.random() 方法为此参数传递随机数字。
		low (uint)：此参数指要为每个像素生成的最低值（0 至 255）。默认值为 0。将此参数设置为较低值会产生较暗的杂点图案，而将此参数设置为较高值会产生较亮的图案。
		high (uint)：此参数指要为每个像素生成的最高值（0 至 255）。默认值为 255。将此参数设置为较低值会产生较暗的杂点图案，而将此参数设置为较高值会产生较亮的图案。
		channelOptions (uint)：此参数指定将向位图对象的哪个颜色通道应用杂点图案。此数字可以是四个颜色通道 ARGB 值的任意组合。默认值为 7。
		grayScale (Boolean)：设置为 true 时，此参数对位图像素应用 randomSeed 值，可有效地褪去图像中的所有颜色。此参数不影响 Alpha 通道。默认值是 false。
		以下示例创建一个位图图像，并对它应用蓝色杂点图案：
		
		import flash.display.Bitmap; 
		import flash.display.BitmapData; 
		 
		var myBitmap:BitmapData = new BitmapData(250, 250,false, 0xff000000); 
		myBitmap.noise(500, 0, 255, BitmapDataChannel.BLUE,false); 
		var image:Bitmap = new Bitmap(myBitmap); 
		addChild(image);
		如果要创建更好的有机外观纹理，请使用 perlinNoise() 方法。perlinNoise() 方法可生成逼真、有机的纹理，是用于烟雾、云彩、水、火或爆炸的理想图案。
		
		由于 perlinNoise() 方法是由算法生成的，因此它使用的内存比基于位图的纹理少。但还是会对处理器的使用有影响，特别是对于旧计算机，会降低 Flash 所创建的内容的处理速度，使屏幕重绘的速度比帧速率慢。这主要是因为需要进行浮点计算，以便处理 Perlin 杂点算法。
		
		此方法接受九个参数（前六个是必需参数）：
		
		baseX (Number)：决定创建的图案的 x（大小）值。
		baseY (Number)：决定创建的图案的 y（大小）值。
		numOctaves (uint)：要组合以创建此杂点的 octave 函数或各个杂点函数的数目。octave 数目越大，创建的图像越精细，但这需要更多的处理时间。
		randomSeed (int)：随机种子数的功能与在 noise() 函数中的功能完全相同。为了获得真正的随机结果，请使用 Math.random() 方法为此参数传递随机数字。
		stitch (Boolean)：如果设置为 true，则此方法尝试缝合（或平滑）图像的过渡边缘以形成无缝的纹理，用于作为位图填充进行平铺。
		fractalNoise (Boolean)：此参数与此方法生成的渐变的边缘有关。如果设置为 true，则此方法生成的碎片杂点会对效果的边缘进行平滑处理。如果设置为 false，则将生成湍流。带有湍流的图像具有可见的不连续性渐变，可以使用它处理更接近锐化的视觉效果，例如，火焰或海浪。
		channelOptions (uint)：channelOptions 参数的功能与在 noise() 方法中的功能完全相同。它指定对哪个颜色通道（在位图上）应用杂点图案。此数字可以是四个颜色通道 ARGB 值的任意组合。默认值为 7。
		grayScale (Boolean)：grayScale 参数的功能与在 noise() 方法中的功能完全相同。如果设置为 true，则对位图像素应用 randomSeed 值，可有效地褪去图像中的所有颜色。默认值是 false。
		offsets (Array)：对应于每个 octave 的 x 和 y 偏移的点数组。通过处理偏移值，可以平滑滚动图像层。偏移数组中的每个点将影响一个特定的 octave 杂点函数。默认值为 null。
		以下示例创建一个 150 x 150 像素的 BitmapData 对象，该对象调用 perlinNoise() 方法来生成绿色和蓝色的云彩效果：
		
		import flash.display.Bitmap; 
		import flash.display.BitmapData; 
		 
		var myBitmapDataObject:BitmapData = new BitmapData(150, 150, false, 0x00FF0000); 
		 
		var seed:Number = Math.floor(Math.random() * 100); 
		var channels:uint = BitmapDataChannel.GREEN | BitmapDataChannel.BLUE  
		myBitmapDataObject.perlinNoise(100, 80, 6, seed, false, true, channels, false, null); 
		 
		var myBitmap:Bitmap = new Bitmap(myBitmapDataObject); 
		addChild(myBitmap);
	 * 
	 * @author Jack
	 */
	public class Tutorial_BitmapData_Noise_Test extends Sprite
	{
		public function Tutorial_BitmapData_Noise_Test()
		{
			addNoiseBitmap();
			addPerlinNoiseBitmap();
		}
		
		private function addNoiseBitmap():void
		{
			var bmd:BitmapData = new BitmapData(150, 150, false, 0xffffffff);
			
			var seed:int = Math.random() * int.MAX_VALUE;
			var low:uint = 0;
			var high:uint = 255;
			var chanelOptions:uint = BitmapDataChannel.RED | BitmapDataChannel.GREEN | BitmapDataChannel.BLUE | BitmapDataChannel.ALPHA;
			var grayScale:Boolean = false;
			
			bmd.noise(seed, low, high, chanelOptions, grayScale);
			
			var bm:Bitmap = new Bitmap(bmd);
			bm.y = 100;
			addChild(bm);
			
			var txt:TextField = new TextField();
			txt.text = "noise bitmap";
			txt.x = bm.x + (bm.width - txt.textWidth)/2;
			txt.y = bm.y + bm.height + 10;
			addChild(txt);
		}
	
		private function addPerlinNoiseBitmap():void
		{
			var bmd:BitmapData = new BitmapData(150, 150, false, 0x00FF0000);
			
			var baseX:Number = 150;
			var baseY:Number = 150;
			var numOctaves:uint = 15;
			var seed:int = Math.random() * int.MAX_VALUE;
			var stitch:Boolean = true;
			var fractalNoise:Boolean = true;
			var chanelOptions:uint = BitmapDataChannel.RED | BitmapDataChannel.GREEN | BitmapDataChannel.BLUE | BitmapDataChannel.ALPHA;
			var grayScale:Boolean = false;
			var offsets:Array = null;
			
			bmd.perlinNoise(baseX, baseY, numOctaves, seed, stitch, fractalNoise, chanelOptions, grayScale, offsets);
			
			var bm:Bitmap = new Bitmap(bmd);
			bm.x = 180;
			bm.y = 100;
			addChild(bm);
			
			var txt:TextField = new TextField();
			txt.text = "perlinNoise bitmap";
			txt.x = bm.x + (bm.width - txt.textWidth)/2;
			txt.y = bm.y + bm.height + 10;
			addChild(txt);
		}
	}
}