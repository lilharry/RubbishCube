import java.io.*;
import java.util.Stack;
public class Cube {
  int[][][] cube;
  Stack<String> solution;
  public Cube() {

    cube = new int[6][3][3];
    //array of faces (3d array)
    // [0,0,0] [1,1,1] [2,2,2] [3,3,3] [4,4,4] [5,5,5]
    // [0,0,0] [1,1,1] [2,2,2] [3,3,3] [4,4,4] [5,5,5]
    // [0,0,0] [1,1,1] [2,2,2] [3,3,3] [4,4,4] [5,5,5]
    //   white  blue    green    red    orange  yellow
    //   front  right   left    down    top     back
    //     F     R        L      D       T       B
    //     0     1        2      3       4       5

    initializeCube(); //fix later
    solution = new Stack<String>();
  }

  private void initializeCube() {
    for (int i = 0; i<6; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k< 3; k++) {
          cube[i][j][k] = i;
        }
      }
    }
  }

  public void scrambleCube() {
    for (int i = 0; i < 20; i++) {

      int x = (int)(Math.random() * 12);

      if (x == 0) {
        rotateF(true);
      } else if (x == 1) {
        rotateF(false);
      } else if (x == 2) {
        rotateR(true);
      } else if (x == 3) {
        rotateR(false);
      } else if (x == 4) {
        rotateL(true);
      } else if (x == 5) {
        rotateL(false);
      } else if (x == 6) {
        rotateD(true);
      } else if (x == 7) {
        rotateD(false);
      } else if (x == 8) {
        rotateT(true);
      } else if (x == 9) {
        rotateT(false);
      } else if (x == 10) {
        rotateB(true);
      } else if (x == 11) {
        rotateB(false);
      }
    }
  }

  public String showNextStepOfSolution() {
    if (!solution.isEmpty()){
      return solution.peek();
    }else{
      return "Solved";
    }
  }

  private String inv(String s) {
    char x = s.charAt(1);
    if (x == '\'') {
      return s.substring(0, 1) + ' ';
    } else {
      return s.substring(0, 1) + '\'';
    }
  }




  //flip array across main diagonal (as in transposing a matrix)
  private void transpose(int face) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (j > i) {
          int temp = cube[face][i][j];
          cube[face][i][j] = cube[face][j][i];
          cube[face][j][i] = temp;
        }
      }
    }
  }
  private void flipRows(int face) {
    for (int r = 0; r<3; r++) {
      int temp = cube[face][r][0];
      cube[face][r][0] = cube[face][r][2];
      cube[face][r][2] = temp;
    }
  }
  private void flipCols(int face) {
    for (int c = 0; c<3; c++) {
      int temp = cube[face][0][c];
      cube[face][0][c] = cube[face][2][c];
      cube[face][2][c] = temp;
    }
  }



  //CW INDICATES CLOCKWISE!
  public void rotateF(boolean CW) {
    transpose(0);

    if (CW) {
      flipRows(0);

      for (int i = 0; i < 3; i++) {
        int temp = cube[1][i][0];
        cube[1][i][0] = cube[4][2][i];
        cube[4][2][i] = cube[2][inv(i)][2];
        cube[2][inv(i)][2] = cube[3][0][inv(i)];
        cube[3][0][inv(i)] = temp;
      }
      if (solution.isEmpty() || !"F ".equals(solution.peek())) {  
        solution.push("F\'");
      } else {
        solution.pop();
      }
    } else {
      flipCols(0);

      for (int i = 0; i < 3; i++) {
        int temp = cube[1][i][0];
        cube[1][i][0] = cube[3][0][inv(i)];
        cube[3][0][inv(i)] = cube[2][inv(i)][2];
        cube[2][inv(i)][2] = cube[4][2][i];
        cube[4][2][i] = temp;
      }
      if (solution.isEmpty() || !"F'".equals(solution.peek())) {  
        solution.push("F ");
      } else {
        solution.pop();
      }
    }
  }

  public void rotateB(boolean CW) {
    transpose(5);

    if (CW) {
      flipRows(5);

      for (int i = 0; i < 3; i++) {
        int temp = cube[2][i][0];
        cube[2][i][0] = cube[4][0][inv(i)];
        cube[4][0][inv(i)] = cube[1][inv(i)][2];
        cube[1][inv(i)][2] = cube[3][2][i];
        cube[3][2][i] = temp;
      }
      if (solution.isEmpty() ||!"B ".equals(solution.peek())) {  
        solution.push("B\'");
      } else {
        solution.pop();
      }
    } else {
      flipCols(5);

      for (int i = 0; i < 3; i++) {
        int temp = cube[2][i][0];
        cube[2][i][0] = cube[3][2][i];
        cube[3][2][i] = cube[1][inv(i)][2];
        cube[1][inv(i)][2] = cube[4][0][inv(i)];
        cube[4][0][inv(i)] = temp;
      }
      if (solution.isEmpty() ||!"B'".equals(solution.peek())) {  
        solution.push("B ");
      } else {
        solution.pop();
      }
    }
  }


  public void rotateL(boolean CW) {
    transpose(2);

    if (CW) {
      flipRows(2);

      for (int i = 0; i < 3; i++) {
        int temp = cube[0][i][0];
        cube[0][i][0] = cube[4][i][0];
        cube[4][i][0] = cube[5][inv(i)][2];
        cube[5][inv(i)][2] = cube[3][i][0];
        cube[3][i][0] = temp;
      }
      if (solution.isEmpty() ||!"L ".equals(solution.peek())) {  
        solution.push("L\'");
      } else {
        solution.pop();
      }
    } else {
      flipCols(2);

      for (int i = 0; i < 3; i++) {

        int temp = cube[0][i][0];
        cube[0][i][0] = cube[3][i][0];
        cube[3][i][0] = cube[5][inv(i)][2];
        cube[5][inv(i)][2] = cube[4][i][0];
        cube[4][i][0] = temp;
      }
      if (solution.isEmpty() ||!"L'".equals(solution.peek())) {  
        solution.push("L ");
      } else {
        solution.pop();
      }
    }
  }


  public void rotateR(boolean CW) {
    transpose(1);

    if (CW) {
      flipRows(1);

      for (int i = 0; i < 3; i++) {
        int temp = cube[5][i][0];
        cube[5][i][0] = cube[4][inv(i)][2];
        cube[4][inv(i)][2] = cube[0][inv(i)][2];
        cube[0][inv(i)][2] = cube[3][inv(i)][2];
        cube[3][inv(i)][2] = temp;
      }
      if (solution.isEmpty() ||!"R ".equals(solution.peek())) {  
        solution.push("R\'");
      } else {
        solution.pop();
      }
    } else {

      flipCols(1);

      for (int i = 0; i < 3; i++) {

        int temp = cube[5][i][0];
        cube[5][i][0] = cube[3][inv(i)][2];
        cube[3][inv(i)][2] = cube[0][inv(i)][2];
        cube[0][inv(i)][2] = cube[4][inv(i)][2];
        cube[4][inv(i)][2] = temp;
      }
      if (solution.isEmpty() ||!"R'".equals(solution.peek())) {  
        solution.push("R ");
      } else {
        solution.pop();
      }
    }
  }
  public void rotateT(boolean CW) {
    transpose(4);

    if (CW) {
      flipRows(4);

      for (int i = 0; i < 3; i++) {
        int temp = cube[1][0][i];
        cube[1][0][i] = cube[5][0][i];
        cube[5][0][i] = cube[2][0][i];
        cube[2][0][i] = cube[0][0][i];
        cube[0][0][i] = temp;
      }
      if (solution.isEmpty() ||!"T ".equals(solution.peek())) {  
        solution.push("T\'");
      } else {  
        solution.pop();
      }
    } else {
      flipCols(4);

      for (int i = 0; i < 3; i++) {
        int temp = cube[1][0][i];
        cube[1][0][i] = cube[0][0][i];
        cube[0][0][i] = cube[2][0][i];
        cube[2][0][i] = cube[5][0][i];
        cube[5][0][i] = temp;
      }
      if (solution.isEmpty() ||!"T'".equals(solution.peek())) {  
        solution.push("T ");
      } else {
        solution.pop();
      }
    }
  }
  public void rotateD(boolean CW) {
    transpose(3);

    if (CW) {
      flipRows(3);
      for (int i = 0; i < 3; i++) {
        int temp = cube[1][2][i];
        cube[1][2][i] = cube[0][2][i];
        cube[0][2][i] = cube[2][2][i];
        cube[2][2][i] = cube[5][2][i];
        cube[5][2][i] = temp;
      }
      if (solution.isEmpty() ||!"D ".equals(solution.peek())) {  
        solution.push("D\'");
      } else {
        solution.pop();
      }
    } else {
      flipCols(3);

      for (int i = 0; i < 3; i++) {
        int temp = cube[1][2][i];
        cube[1][2][i] = cube[5][2][i];
        cube[5][2][i] = cube[2][2][i];
        cube[2][2][i] = cube[0][2][i];
        cube[0][2][i] = temp;
      }
      if (solution.isEmpty() ||!"D'".equals(solution.peek())) {  
        solution.push("D ");
      } else {
        solution.pop();
      }
    }
  }

  //inverse for some edge case problems
  private int inv(int i) {
    if (i == 0) {
      return 2;
    }
    if (i == 1) {
      return 1;
    }
    return 0;
  }

  public String toString() {
    String ans = "";
    for (int i = 0; i<cube.length; i++) {
      for (int j = 0; j < cube[1].length; j++) {
        for (int k = 0; k<cube[1][1].length; k++) {
          ans += cube[i][j][k] + " ";
        }
        ans+= "\n";
      }
      ans+= "\n-------------\n";
    }
    return ans;
  }
}