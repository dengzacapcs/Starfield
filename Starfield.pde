Particle[] particles = new Particle[100];
void setup()
{
	size(500,500);
	particles[0] = new OddballParticle(250,250);
	particles[1] = new JumboParticle(250,250);
	for (int i = 2; i<100; i++){
		particles[i] = new NormalParticle(250,250);
	}
}
void draw()
{
	background(255);
	for (int i = 0; i<100; i++){
		particles[i].move();
		particles[i].show();
	}
}
class NormalParticle implements Particle
{
	double x, y, angle, speed;
	int c;
	NormalParticle(int x1, int y1){
		x = x1;
		y = y1;
		angle = Math.random()*Math.PI*2;
		speed = Math.random()*10;
		c = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	}
	public void move(){
		x += speed*Math.cos(angle);
		y += speed*Math.sin(angle);
	}
	public void show(){
		fill(c);

		ellipse((float)x, (float)y, 5f,5f);
	}
}
interface Particle
{
	void move();
	void show();
}
class OddballParticle implements Particle//uses an interface
{
	double x,y,angle,speed;
	int c;
	OddballParticle(int x1, int y1){
		x = x1;
		y = y1;
		angle = Math.random()*Math.PI*2;
		speed = Math.random()*10;
		c = 0;
	}
	public void move(){
		x += speed*Math.cos(angle);
		y += speed*Math.sin(angle);
	}
	public void show(){
		ellipse((float)x, (float)y, (float)Math.random()*50,(float)Math.random()*50f);
	}
}
class JumboParticle extends NormalParticle//uses inheritance
{
	JumboParticle(int x1, int y1){
		super(x1, y1);
	}
	public void show(){
		fill(c);
		ellipse((float)x, (float)y, 50f,50f);
	}
}