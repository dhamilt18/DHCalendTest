let xIsNext = true;
let boardArr = [];
const table = document.getElementById('table');
const inputNumber = document.getElementById('number');
const startButton = document.getElementById('start');
const endGameDiv = document.getElementById('endgame');

const endGame = (char) => {
  endGameDiv.style.display = 'block';
  endGameDiv.innerHTML = `Congratulations player ${char}! You've won. Refresh to play again!`;
};

const validateClick = (e) => {
  const charToUse = xIsNext ? 'X' : 'O';
  const id = e.target.id;
  const row = e.target.getAttribute('data-row');
  const column = e.target.getAttribute('data-column');
  if (boardArr[row][column] === null) {
    boardArr[row][column] = charToUse
    document.getElementById(id).innerText = boardArr[row][column];
    xIsNext = !xIsNext;
    checkWin(boardArr) ? endGame(charToUse === 'X' ? 'O' : 'X') : null;
  };
};

const printBoard = (arr) => {
  let idCount = 0;
  for (let i = 0; i < arr.length; i++) {
    const tr = document.createElement('tr');
    for (let j = 0; j < arr.length; j++) {
      const td = document.createElement('td');
      td.addEventListener('click', validateClick, false);
      td.setAttribute('id', idCount);
      td.setAttribute('data-column', j);
      td.setAttribute('data-row', i);
      tr.appendChild(td);
      idCount++;
    }
    table.appendChild(tr);
  }
};

const generateBoard = (n) => {
  const arr = [];
  for (let i = 0; i < n; i++) {
    const subArr = [];
    for (let j = 0; j < n; j++) {
      subArr.push(null);
    }
    arr.push(subArr);
  }
  return arr;
};

const checkWin = (arr) => {
  for (let column = 0; column < arr.length; column++) {
    const caseMatch = arr[column][0];
    if (caseMatch !== null) {
      for (let row = 0; row < arr.length; row++) {
        if (caseMatch !== arr[column][row]) {
          break;
        } else {
          if (row === arr.length - 1) {
            return true;
          }
        }
      }
    }
  }
  for (let column = 0; column < arr.length; column++) {
    const caseMatch = arr[0][column];
    if (caseMatch !== null) {
      for (let row = 0; row < arr.length; row++) {
        if (caseMatch !== arr[row][column]) {
          break;
        } else {
          if (row === arr.length - 1) {
            return true;
          }
        }
      }
    }
  }
  for (let column = 0; column < arr.length; column++) {
    const caseMatch = arr[0][0];
    if (caseMatch !== null) {
      for (let row = 0; row < arr.length; row++) {
        if (caseMatch !== arr[row][row]) {
          break;
        } else {
          if (row === arr.length - 1) {
            return true;
          }
        }
      }
    }
  }
  for (let column = 0; column < arr.length; column++) {
    const caseMatch = arr[0][arr.length - 1];
    if (caseMatch !== null) {
      for (let row = 0; row < arr.length; row++) {
        if (caseMatch !== arr[row][arr.length - 1 - row]) {
          break;
        } else {
          if (row === arr.length - 1) {
            return true;
          }
        }
      }
    }
  }
  return false;
};

const startGame = (e) => {
  e.preventDefault();
  boardArr = generateBoard(inputNumber.value);
  printBoard(boardArr);
};

startButton.addEventListener('click', startGame, false);