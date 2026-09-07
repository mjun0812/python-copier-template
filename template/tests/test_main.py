from __future__ import annotations

from typing import TYPE_CHECKING

from {{package_name}}.__main__ import main

if TYPE_CHECKING:
    import pytest


def test_main_prints_greeting(capsys: pytest.CaptureFixture[str]) -> None:
    """Test that main prints the project greeting."""
    main()
    assert capsys.readouterr().out == "Hello from {{project_name}}!\n"
