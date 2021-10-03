#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/wait.h>


#define BAR_ITEMS  4
#define ITEMS_LEN  102  // The maximum length of the bar item
#define SEP_1      "["
#define SEP_2      "]"


char dwm_items[BAR_ITEMS][ITEMS_LEN];


void execute_cmd(int fd, char *cmd[]){
	if(dup2(STDOUT_FILENO, fd) == -1){
		perror("dup2");
		exit(EXIT_FAILURE);
	}

	int ret = execvp(cmd[0], cmd);  // Should exit on success
	exit(ret);  // Make sure there is no zombies
}


void get_cmd(char *buf, int buf_len, char *cmd[]){
	int fd[2];   // fd[0] is for reading and fd[1] is for writing

	if(pipe(fd) == -1){
		perror("pipe");
		exit(EXIT_FAILURE);
	}

	int pid = fork();
	if(pid == -1){
		perror("fork");
		exit(EXIT_FAILURE);
	}else if(pid == 0){
		close(fd[0]);  // Close the read end of the pipe
		execute_cmd(fd[1], cmd);
	}else{
		int c_status;
		wait(&c_status);  // Wait until child closes
		if(c_status != 0){
			perror("wait");
			exit(EXIT_FAILURE);
		}

		close(fd[1]);  // Close the write end of the pipe
		int read_pos = read(fd[0], &buf, (buf_len - 1)*sizeof(char));

		if(read_pos == -1){
			perror("read");
			exit(EXIT_FAILURE);
		}
		close(fd[0]);  // Close the read end of the pipe

		buf[read_pos] = '\0';  // Null terminate the string
	}
}


void set_bar(){
	int pid = fork();

	if(pid == 0){
		char bar[ITEMS_LEN*BAR_ITEMS];
		dwm_bar[0] = '\0';

		for(int i = 0; i < BAR_ITEMS; i++){
			strcat(dwm_bar, dwm_items[i]);
		}

		char *argv[] = {"xsetroot", "-name", dwm_bar};

	 	execute_cmd(STDOUT_FILENO, argv);
	}
}


void resources(unsigned int item_no){
	if(item_no > ITENS_LEN){
		perror("item_no battery");
		exit(EXIT_FAILURE);
	}

	c
}


void battery(unsigned int item_no){
	if(item_no > ITENS_LEN){
		perror("item_no battery");
		exit(EXIT_FAILURE);
	}

	char charge[4];
	char status[12];

	char *charge_cmd[] = {"cat", "/sys/class/power_supply/BATT/capacity"};
	char *status_cmd[] = {"cat", "/sys/class/power_supply/BATT/status"};

	get_cmd(charge, 4, charge_cmd);
	get_cmd(status, 12, status_cmd);

	dwm_bar[item_no][0] = '\0';

	strcat(dwm_bar[item_no], SEP_1);
	strcat(dwm_bar[item_no], "BAT ");
	strcat(dwm_bar[item_no], charge);
	strcat(dwm_bar[item_no], " ");
	strcat(dwm_bar[item_no], status);
	strcat(dwm_bar[item_no], SEP_2);
}



int main(int argc, char *argv[]){
	while(1){
		set_bar();
		sleep(1);
	}
}
