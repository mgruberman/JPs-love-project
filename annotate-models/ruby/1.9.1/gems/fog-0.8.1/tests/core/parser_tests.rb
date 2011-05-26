Shindo.tests('Fog::Parsers', 'core') do

  class TestParser < Fog::Parsers::Base
    def reset
      super
      reset_my_array
    end

    def reset_my_array
      @my_array = []
    end

    def end_element(name)
      case name
      when 'key1', 'key2', 'key3', 'longText'
        @response[name] = value
      when 'myArray'
        @response[name] = @my_array
        reset_my_array
      when 'id'
        @my_array << value.to_i
      end

    end
  end

  @xml = %{
<MyResponse>
  <MyObject>
    <key1>value1</key1>
    <key2>value2</key2>
    <myArray>
      <id>1</id>
      <id>2</id>
      <id>3</id>
    </myArray>
    <longText>
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Donec quis metus arcu, quis cursus turpis.
Aliquam leo lacus, luctus vel iaculis id,
posuere eu odio. Donec sodales, ante porta condimentum
</longText>
    <key3>value3</key3>
  </MyObject>
<MyResponse>
}

  @response = {
    'key1' => 'value1',
    'key2' => 'value2',
    'key3' => 'value3',
    'myArray' => [1,2,3],
    'longText' => %{
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Donec quis metus arcu, quis cursus turpis.
Aliquam leo lacus, luctus vel iaculis id,
posuere eu odio. Donec sodales, ante porta condimentum
}
  }


  tests('TestParser').returns(@response) do
    test_parser = TestParser.new
    Nokogiri::XML::SAX::Parser.new(test_parser).parse(@xml)
    test_parser.response
  end
end
