from {{package_name}} import hello


def test_hello() -> None:
    result = hello()
    expected = "Hello from {{project_name}}!"
    assert result == expected


def test_hello_return_type() -> None:
    result = hello()
    assert isinstance(result, str)
