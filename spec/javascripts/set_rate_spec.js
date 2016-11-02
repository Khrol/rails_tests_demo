jasmine.Ajax.install();

for(var i=0; i < 100; i++) {
    describe("set_rate" + i, function() {
        element = $("<p data-country='Uganda'>42</p>");

        beforeEach(function(done) {
            jasmine.Ajax.stubRequest(
                '/average/calculate_api?country=Uganda'
            ).andReturn({
                status: 200,
                statusText: 'HTTP/1.1 200 OK',
                contentType: 'application/json;charset=UTF-8',
                responseText: '{"rate": 8.5}'
            });

            set_rate(element).always(done)
        });

        it("fills text based on api response", function() {
            expect(jasmine.Ajax.requests.mostRecent().url).toBe('/average/calculate_api?country=Uganda');
            expect(element[0].textContent).toBe('8.5');
        });
    });
}


