/**
 * @author Subhendu
 */

function calculatePageNo(heights, height){
	   // alert("Inside calculatePageNo()")
		var sum = 0.0;	
		for (var i = 0; i < heights.length; i++){
			sum += parseFloat(heights[i]);
		    if (height < sum) {
		    	return i + 1;	
		    }
		}
		return 1;
	}