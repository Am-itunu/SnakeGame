# Snake Game

This simple Snake Game is implemented using the Processing library in Java. The game provides a basic interface for users to control a snake, with the goal of eating randomly generated objects to grow longer. The game ends if the snake collides with itself or the game boundaries.

## Usage

To play the game, use the following controls:
- **W**: Move the snake up
- **A**: Move the snake left
- **S**: Move the snake down
- **D**: Move the snake right

## Features

- Snake movement controlled by W, A, S, D keys.
- Randomly generated objects for the snake to consume.
- Score display indicating the length of the snake.
- Gameover sequence with a brief pause and automatic reset.

## Installation

To run the Snake Game, make sure you have Processing installed on your system. Open the `snakeGame.pde` file using the Processing IDE and click the "Run" button.

## Code Structure

- `snakeGame`: The main class extending `PApplet`, responsible for handling game logic, drawing, and user input.
- `overlaps(PVector p1, PVector p2)`: A method to check if two vectors overlap.
- `randomize(PVector position, float a, float b)`: A method to randomize the position within a specified range.
- `endgame()`: A method to handle the end of the game.
- `reset()`: A method to reset the game state.
- `setup()`: Setup method initializing the game environment.
- `draw()`: Method for rendering graphics and handling game logic.
- `keyPressed()`: Method to handle keypress events.
- `main(String[] args)`: Main method to launch the game.

## Requirements

- Java
- Processing library

## Contributing

Feel free to contribute to the project by submitting bug reports, feature requests, or even pull requests. Your input is highly appreciated!
