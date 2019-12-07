let matrix = []
for(let i = 0; i < 5; i++){
let row = []
 for(let j = 0; j < 7; j++){
	row.push(".")
 }
 matrix.push(row)
}
matrix[0][0] = "S"
matrix[4][3] = "E"
matrix[1][1] = "#"
matrix[2][1] = "#"
matrix[4][0] = "#"
matrix[3][2] = "#"
 
matrix[3][3] = "#"
matrix[4][2] = "#"


matrix[4][5] = "#"
matrix[3][5] = "#"
matrix[2][5] = "#"
matrix[1][5] = "#"
matrix[0][5] = "#"
matrix[0][4] = "#"
matrix[0][3] = "#"
matrix[1][3] = "#"
matrix[1][4] = "#"

function findMinMoves(start,matrix){
  let moves = 0
  let levelsToExplore = 1
  let levelsLeft = 0
  let visited = matrix.map((row) => row.map((el) => false))
  let queue = [start]
  while(queue.length > 0){
      let node = queue.shift()
      let i = node[0]
      let j = node[1]
      if(matrix[i][j] === "E"){
        return moves + 1
      }
      visited[i][j] = true
      let allNeighbors = getAllNeighbors(i,j,visited,matrix) // return nestedArr
      for(let arr of allNeighbors){
        if(visited[arr[0]][arr[1]]) continue
        queue.push(arr)
        levelsLeft++
      }
      levelsToExplore--
      if(levelsToExplore === 0){
        moves++
        levelsToExplore = levelsLeft
        levelsLeft = 0
      }
   }
 
  return null
}



function getAllNeighbors(i,j,visited,matrix){
  let result = []
  let r = [-1, 1, 0 , 0]
  let c = [0, 0, -1, 1]
  for(let k = 0; k < r.length; k++){
    let rr = i + r[k]
    let cc = j + c[k]
    if(rr < 0 || rr >= matrix.length || cc < 0 || cc >= matrix[0].length) continue
    if(visited[rr][cc] || matrix[rr][cc] === "#") continue
    result.push([rr,cc])
  }
  return result
}




