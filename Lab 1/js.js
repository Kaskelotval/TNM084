$(document).ready(function () {

    //get canvas
    var canvas = document.getElementById("cvs");
    var context = canvas.getContext("2d");
    

    //dimensions of canvas
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    var width = canvas.width;
    var height = canvas.height;

    //ImageData object
    var imagedata = context.createImageData(width, height);

    //click
    function getCursorPosition(canvas, event) {
        var rect = canvas.getBoundingClientRect();
        var x = event.clientX - rect.left;
        var y = event.clientY - rect.top;
        console.log("x: " + x + " y: " + y);
    }

    //create image
    function createImage(time) {
        //loop all pixels
        for (var x = 0; x < width; x++) {
            for(var y=0;y<height;y++)
            {
                var pixelidx = (y * width + x) * 4;

                var simplexValue = noise.perlin3(x, y, time);
                //console.log(simplexValue);
                var red = Math.abs((x * y*time) );
                var green = Math.abs(Math.pow(y * x, 2) );
                var blue = Math.abs(Math.exp(x*Math.abs(simplexValue)) );

                red = Math.abs((red + time) % 256-256/2);
                green = Math.abs((green + time) % 256-256/2);
                blue = Math.abs((blue + time) % 256-256/2);
    
                imagedata.data[pixelidx] = red;     
                imagedata.data[pixelidx + 1] = green; 
                imagedata.data[pixelidx + 2] = blue;  
                imagedata.data[pixelidx + 3] = 256;   
            }
        }
    }
    // Main loop
    function main(tframe) {
        // Request animation frames
        window.requestAnimationFrame(main);

        // Create the image
        createImage(Math.floor(tframe / 10));

        // Draw the image data to the canvas
        context.putImageData(imagedata, 0, 0);
    }

    // Call the main loop
    main(0);
})