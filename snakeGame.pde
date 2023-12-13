package snakegame;

import processing.core.PApplet;
import processing.core.PVector;


public class snakeGame extends PApplet {

    boolean gameover = false; 
    float block = 5;

    ArrayList<PVector> snakePositions = new ArrayList<PVector>();
    PVector snakeDirection = new PVector(1, 0);
    PVector objPosition = new PVector(0, 0);

    public boolean overlaps(PVector p1,PVector p2){
        PVector c1 = new PVector(p1.x + block/2, p1.y + block/2);
        PVector c2 = new PVector(p2.x + block/2, p2.y + block/2);
        return PVector.dist(c1, c2) < block;
    }

    public void randomize(PVector position, float a, float b) {
        position.x = random(a, b);
        position.y = random(a,b);
    }

    public void endgame() {
        gameover = true;
        background(0);
        fill(255);
        text("Gameover", 10, 20);
    }

    public void reset(){
        gameover = false;
        snakePositions.clear();

        PVector c = new PVector(width/2, height/2);

        snakePositions.add(c);
        randomize(objPosition, 0, width-block);
    }

    void setup(){
        size(300, 300);

        frameRate(25);

        reset();
    }

    void draw() {
        background(0);

        if (gameover == true){

            int startTime = millis();
            while (millis() - startTime < 5000) {
            // Waiting for 5000 milliseconds (5 seconds)
            }
            reset();
            return;
        }

        fill(255);

        text("Score: " + (snakePositions.size()-1), 10, 20);
        fill(0);
        stroke(255);

        rect(objPosition.x, objPosition.y, block, block);
        //drawing the snake
        for(int i = snakePositions.size() - 1; i> -1; i--){
            PVector position = snakePositions.get(i);
            if (i==0){
                // Move to the direction
                position.x += snakeDirection.x * block;
                position.y += snakeDirection.y * block;

                if (position.x < 0) {
                    position.x = width;
                }
                else if (position.x > width) {
                    position.x = 0;
                }
                if(position.y < 0) {
                    position.y = height;
                }
                else if(position.y > height){
                    position.y = 0;
                }

                //overlapping obj
                if(overlaps(position, objPosition)) {
                    randomize(objPosition, 0, width-block);
                    //increase snake tail
                    PVector last = snakePositions.get(snakePositions.size() - 1);
                    PVector next =new PVector(last.x-(snakeDirection.x*block), last.y-(snakeDirection.x*block));
                    snakePositions.add(next); 
                }            

            }else{

                //check tail overlapping for gameover sequence
                if (i > 1 && overlaps(position, snakePositions.get(0))) {
                    endgame();

                    break;
                }else {

                }
                PVector before = snakePositions.get(i-1);
                position.x = before.x;
                position.y = before.y;
            }

            rect(position.x, position.y, block, block);

        }
        
    }
    void keyPressed() {
        if (key == 'a' && snakeDirection.x != 1) {
            snakeDirection.x = -1;
            snakeDirection.y = 0;

        }

        else if(key == 'd' && snakeDirection.x != -1){
            snakeDirection.x = 1;
            snakeDirection.y = 0;
        }
        else if(key == 's' && snakeDirection.y != -1){
            snakeDirection.x = 0;
            snakeDirection.y = 1;
        }
        else if(key == 'w' && snakeDirection.y != 1){
            snakeDirection.x = 0;
            snakeDirection.y = -1;
        }
    }
    // ... (rest of your code)

    public static void main(String[] args) {
        PApplet.main("snakeGame");
    }
}

