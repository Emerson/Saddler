var Saddle = {

	// Initalize the App
	init: function() {
		var that = this;
		that.randomize();
		$('#submit').click(function(e) {
			e.preventDefault();
			that.submit();
		});
		$('#reseed').click(function(e) {
			e.preventDefault();
			that.randomize();
		});
	},

	// Randomizes our 5x5 array
	randomize: function() {
		$.each($('table tr'), function(index, tr) {
			$(tr).children('td').each(function(index, td) {
				var randomNumber = Math.floor(Math.random()*50);
				$(td).find('input').val(randomNumber);
			});
		});
	},

	// Submit the array
	submit: function() {
		var that = this;
		var submitData = [];
		$('td').removeClass('saddle');
		$.each($('table tr'), function(tr_index, tr) {
			$(tr).children('td').each(function(td_index, td) {
				if(submitData[tr_index] instanceof Array) {
					submitData[tr_index].push($(td).find('input').val());
				}else{
					submitData[tr_index] = [];
					submitData[tr_index].push($(td).find('input').val());
				}
			});
		});
		$.post('/saddle', {grid: submitData}, function(response) {
			if(response.found === 'true') {
				that.highlight_points(response.saddle_points);
			}else{
				$('#message').show().html('None found this time...').fadeOut(1200);
			}
		}, 'json');
	},

	// Highlight the points on the grid
	highlight_points: function(points) {
		$.each(points, function(index, item) {
			$('tr:eq('+item.y+')').find('td:eq('+item.x+')').addClass('saddle');
		});
	}

}

$(document).ready(function() {
	Saddle.init();
});