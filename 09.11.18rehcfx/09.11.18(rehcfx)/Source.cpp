# include <iostream>
# include <windows.h>
# include <time.h>
# include <conio.h>
#include <stdio.h>  
#include <conio.h>
#include <fstream>
using namespace std; char main_color[] = "color ##";
int snake_size, change_x, change_y, coordinates_x[1000], coordinates_y[1000], food_x = -1, food_y = -1, score = 1;
char symbol, a[1000][1000], plays, resumes;
char file[50];
char name[50];
int score_save;
const int N = 13, M = 17, INTERVAL = 200;
void change_color()
{
	char x = rand() % 16, y = rand() % 16;
	if (x == y)
		++y;
	y %= 16;
	if (x > 9)
		x += 'A' - 10;
	else
		x += '0';
	if (y > 9)
		y += 'A' - 10;
	else
		y += '0';
	main_color[6] = x;
	main_color[7] = y;
	system(main_color);
}
void change_direction()
{
	symbol = _getch();
	switch (symbol)
	{
	case 'w': { change_x = -1; change_y = 0; } break;
	case 'a': { change_x = 0; change_y = -1; } break;
	case 's': { change_x = 1; change_y = 0; } break;
	case 'd': { change_x = 0; change_y = 1; } break;
	case 32: change_color(); break;
	default: break;
	}
}
void show_table()
{
	system("cls");
	for (int i = 0; i <= N + 1; ++i)
	for (int j = 0; j <= M + 1; ++j)
		cout << (i == 0 || j == 0 || i == N + 1 || j == M + 1 ? '#' : a[i][j]) << (j <= M ? "" : "\n");
}
void clear_snake_on_table()
{
	for (int i = 1; i <= snake_size; ++i)
		a[coordinates_x[i]][coordinates_y[i]] = ' ';
}
void show_snake_on_table()
{
	if (change_x == 1 && change_y == 0) a[coordinates_x[1]][coordinates_y[1]] = 'v';
	if (change_x == -1 && change_y == 0) a[coordinates_x[1]][coordinates_y[1]] = '^';
	if (change_x == 0 && change_y == 1) a[coordinates_x[1]][coordinates_y[1]] = '>';
	if (change_x == 0 && change_y == -1) a[coordinates_x[1]][coordinates_y[1]] = '<';
	for (int i = 2; i <= snake_size; ++i)
		a[coordinates_x[i]][coordinates_y[i]] = '@';
}
bool game_over()
{
	for (int i = 2; i <= snake_size; ++i)
	if (coordinates_x[1] == coordinates_x[i] && coordinates_y[1] == coordinates_y[i]) return true;
	return false;
}
void check_coordinates()
{
	if (coordinates_x[1] > N) coordinates_x[1] = 1;
	if (coordinates_x[1] < 1) coordinates_x[1] = N;
	if (coordinates_y[1] > M) coordinates_y[1] = 1;
	if (coordinates_y[1] < 1) coordinates_y[1] = M;
}
void next_step()
{
	clear_snake_on_table();

	for (int i = snake_size; i >= 2; --i)
	{
		coordinates_x[i] = coordinates_x[i - 1];
		coordinates_y[i] = coordinates_y[i - 1];
	}

	coordinates_x[1] += change_x;
	coordinates_y[1] += change_y;

	check_coordinates();

	if (coordinates_x[1] == food_x && coordinates_y[1] == food_y)
	{
		snake_size++;
		food_x = -1;
		food_y = -1;
		score++;
	}

	show_snake_on_table();

	if (game_over() == true)
	{
		cout << "You're looser! \n";
		ofstream F;
		F.open("Resultat.txt", ios_base::app);
		cout << "score " << score << endl;
		F << name << " = score: " << score << endl;
		F.close();
		_getch();
		system("pause");
		exit(0);
	}
}
bool food_check()
{
	if (food_x == -1 && food_y == -1) return false;
	return true;
}
void place_food()
{
	srand(time(NULL));
	for (int i = 1; i <= 9; ++i)
	{
		int x = rand(), y = rand();
		if (x < 0) x *= -1;
		if (y < 0) y *= -1;
		x %= (N + 1);
		y %= (M + 1);
		if (x == 0) ++x;
		if (y == 0) ++y;
		if (a[x][y] != '@' && a[x][y] != 'v' && a[x][y] != '^' && a[x][y] != '<' && a[x][y] != '>')
		{
			food_x = x;
			food_y = y;
			a[x][y] = '+';
			return;
		}
	}
}
void standart_settings()
{
	snake_size = 2;
	coordinates_x[1] = 1;
	coordinates_y[1] = 2;
	coordinates_x[2] = 1;
	coordinates_y[2] = 1;

	change_x = 0;
	change_y = 1;

}
int main()
{
	cout << "Your name?(Print)" << endl;
	cin >> name;
	cout << "-------------------" << endl;
	cout << "|                 |" << endl;
	cout << "|   Start game    |" << endl;
	cout << "|         (g)     |" << endl;
	cout << "|   Exit          |" << endl;
	cout << "|    (x)          |" << endl;
	cout << "|                 |" << endl;
	cout << "-------------------" << endl;
	cin >> plays;
	system("cls");
	if (plays == 'g')
	{
		standart_settings();

		while (1)
		{
			if (_kbhit() == true)
				change_direction();

			next_step();

			if (food_check() == false)
				place_food();
			show_table();
			Sleep(INTERVAL);
		}
	}
	else if (plays == 'x')
	{
		cout << "Good bay" << endl;
		exit(0);
	}
}