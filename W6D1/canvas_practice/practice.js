document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  const ctx = canvas.getContext('2d');

  //ctx.height = 500;
  // ctx.fillStyle = "red";
  //ctx.fillRect(100, 100, 400, 300); 
  
  
  void ctx.beginPath();
  ctx.arc(100, 75, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = 'purple';
  ctx.lineWidth = '2';
  ctx.fillStyle = "yellow";
  ctx.stroke();
  ctx.fill();
});

function findMouseLoc(event) {
  let x = event.clientX;
  let y = event.clientY;
  alert(`${x}, ${y}`);
  createParentCircle();
}

document.addEventListener("click", findMouseLoc);

function createParentCircle() {
  
}