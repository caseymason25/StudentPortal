
jQuery(document).ready(function($) {
	/* Current Weather API Call */
	$.ajax({
		url : "https://api.wunderground.com/api/3ccde7030d2e1dc3/forecast/alerts/conditions/q/KS/66502.json",
		dataType : "jsonp",
		success : function(parsed_json) {
			var current = parsed_json['current_observation'];
			var alerts = parsed_json['alerts'];
			var forecast = parsed_json['forecast'];

			var icon_url = current.icon_url;
			var temperature = current.temp_f;
			var humidity = current.relative_humidity;

			$(alerts).each(function() {
				if (this.type == "SPE") {

				} else {
					$('.alert').children('.weather-value').html(this.description + ' until ' + this.expires );
				}
			});
			
			/* Small nav bar weather values */
			$('.temp').children('.weather-value').html(temperature + "&deg;");
			$('.humidity').children('.weather-value').html(humidity);
			$('.weather-icon-img').attr('src', icon_url);
			
			/* Right now weather on weather page */
			$('.right-now-icon').attr('src', current.icon_url);
			$('.right-now-description').html(current.icon);
			$('.right-now-temp').children('.hourly-data').html(current.temp_f + "&deg;");
			$('.right-now-feels-temp').children('.hourly-data').html(current.feelslike_f + "&deg;");
			$('.right-now-humidity').children('.hourly-data').html(current.relative_humidity);
			$('.right-now-wind').children('.hourly-data').html(current.wind_dir + " at " + current.wind_mph + " mph");
			
			console.log(current);
		}
	});
	/* End Current Weather */
  
  
	/* Hourly Forecast API Call */
	$.ajax({
		url : "http://api.wunderground.com/api/3ccde7030d2e1dc3/hourly/q/KS/Manhattan.json",
		dataType : "jsonp",
		success : function(parsed_json) {
			var hourlyForecast = parsed_json['hourly_forecast'];
			
			/* Populate the hourly table */
			$('.hourly-time').each(function(index) {
			$(this).html(hourlyForecast[index].FCTTIME.civil);
			});

			$('.hourly-icon').each(function(index) {
			$(this).attr('src', hourlyForecast[index].icon_url);
			});
			
			$('.hourly-description').each(function(index) {
			$(this).html(hourlyForecast[index].icon);
			});

			$('.hourly-temp span').each(function(index) {
			$(this).html(hourlyForecast[index].temp.english + "&deg;");
			});

			$('.hourly-feels-temp .hourly-data').each(function(index) {
			$(this).html(hourlyForecast[index].feelslike.english + "&deg;");
			});

			$('.hourly-humidity .hourly-data').each(function(index) {
			$(this).html(hourlyForecast[index].humidity);
			});
			
			$('.hourly-wind .hourly-data').each(function(index) {
			$(this).html(hourlyForecast[index].wdir.dir + " at " + hourlyForecast[index].wspd.english + " mph");
			});
			/* end populate */
			
			console.log(hourlyForecast);
		}
	});
	/* End Hourly Forecast */
});
