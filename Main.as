package {
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.events.*;
	import flash.display.Graphics;

	public class Main extends MovieClip {

		var mc: MovieClip = null;
		var editMode: Boolean = true;
		var p1: Point ;
		var p2: Point ;
		var p3: Point ;

		var dist1X: Number; // = (p2.x - p1.x);
		var dist1Y: Number; // = (p2.y - p1.y);
		var hypotenouse1: Number; // = Math.sqrt((dist1X * dist1X) + (dist1Y * dist1Y));
		var cos1: Number; // = dist1X / hypotenouse1;
		var sin1: Number; // = dist1Y / hypotenouse1;


		var dist2X: Number; // = (p3.x - p2.x);
		var dist2Y: Number; // = (p3.y - p2.y);
		var hypotenouse2: Number; // = Math.sqrt((dist2X * dist2X) + (dist2Y * dist2Y));
		var cos2: Number; // = dist2X / hypotenouse2;
		var sin2: Number; // = dist2Y / hypotenouse2;

		var per: Number = 0;
		var g: Graphics ;
		var arr: Array = [];

		public function Main() {
			// constructor code
			g = this.graphics;
			p1 = new Point(20, stage.stageHeight - 20);
			p2 = new Point(stage.stageWidth / 2, 200);
			p3 = new Point(stage.stageWidth - 20, stage.stageHeight - 20);
			
			c1.x = p1.x;
			c1.y = p1.y;
			c1.point = p1;

			c2.x = p2.x;
			c2.y = p2.y;
			c2.point = p2;

			c3.x = p3.x;
			c3.y = p3.y;
			c3.point = p3;


			stage.addEventListener(Event.ENTER_FRAME, update);
			c1.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			c2.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			c3.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onUp);

			goBTN.addEventListener(MouseEvent.CLICK, function (e: MouseEvent): void {
				editMode = false;
				per = 0;
				dist1X = (p2.x - p1.x);
				dist1Y = (p2.y - p1.y);
				hypotenouse1 = Math.sqrt((dist1X * dist1X) + (dist1Y * dist1Y));
				cos1 = dist1X / hypotenouse1;
				sin1 = dist1Y / hypotenouse1;


				dist2X = (p3.x - p2.x);
				dist2Y = (p3.y - p2.y);
				hypotenouse2 = Math.sqrt((dist2X * dist2X) + (dist2Y * dist2Y));
				cos2 = dist2X / hypotenouse2;
				sin2 = dist2Y / hypotenouse2;
				arr = [];

			});

		}





		function onDown(e: MouseEvent): void {
			mc = MovieClip(e.target);
		}


		function onUp(e: MouseEvent): void {
			mc = null;
		}

		function update(e: Event): void {

			g.clear();
			g.lineStyle(1, 0);
			g.moveTo(p1.x, p1.y);
			g.lineTo(p2.x, p2.y);
			g.lineTo(p3.x, p3.y);

			for (var i: int = 0; i < arr.length; i++) {
				g.drawCircle(arr[i].x, arr[i].y, 1);
			}

			if (editMode) {
				if (mc) {
					mc.x = stage.mouseX;
					mc.point.x = stage.mouseX;
					mc.y = stage.mouseY;
					mc.point.y = stage.mouseY;

				}
				return
			}


			if (per < 1) {
				per += 0.01;
			} else {
				editMode = true;
			}

			var startPos: Point = new Point(p1.x + (cos1 * (hypotenouse1 * per)), p1.y + (sin1 * (hypotenouse1 * per)));
			var endPos: Point = new Point(p2.x + (cos2 * (hypotenouse2 * per)), p2.y + (sin2 * (hypotenouse2 * per)));

			var trW: Number = endPos.x - startPos.x;
			var trH: Number = endPos.y - startPos.y;
			var hyp: Number = Math.sqrt((trW * trW) + (trH * trH));
			var cos: Number = trW / hyp;
			var sin: Number = trH / hyp;

			g.moveTo(startPos.x, startPos.y);
			g.lineTo(endPos.x, endPos.y);

			var midX: Number = startPos.x + (hyp * cos * per);
			var midY: Number = startPos.y + (hyp * sin * per);

			g.moveTo(midX, midY);
			arr.push(new Point(midX, midY));

			g.drawCircle(midX, midY, 10);


		}

	}

}