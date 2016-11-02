function set_rate(element) {
    country = element.data('country');
    return $.getJSON('/average/calculate_api', {country: country}, function(data) {
        element.text(data['rate'])
    })
}
