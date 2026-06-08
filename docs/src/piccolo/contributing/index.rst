.. _Contributing:

Contributing
============

If you want to dig deeper into the Piccolo internals, follow these
instructions.

-------------------------------------------------------------------------------

Running Cockroach
-----------------

To get a local Cockroach instance running, you can use:

.. code-block:: console

    cockroach start-single-node --insecure --store=type=mem,size=2GiB

Make sure the test database exists:

.. code-block:: console

    cockroach sql --insecure
    >>> create database piccolo;
    >>> use piccolo;

-------------------------------------------------------------------------------

Get the tests running
---------------------

* Clone the `Git repo <https://github.com/piccolo-orm/piccolo>`_
* ``cd piccolo``
* Install `uv <https://docs.astral.sh/uv/getting-started/installation/>`_
* Install development and test dependencies: ``uv sync --group dev --group test``
* Install database drivers as needed:

  * Postgres: ``uv sync --extra postgres``
  * SQLite: ``uv sync --extra sqlite``

* Setup Postgres, and make sure a database called ``piccolo`` exists (see ``tests/postgres_conf.py``).
* Run the automated code linting/formatting tools: ``uv run ./scripts/lint.sh``
* Run the test suite with Postgres: ``uv run ./scripts/test-postgres.sh``
* Run the test suite with Cockroach: ``uv run ./scripts/test-cockroach.sh``
* Run the test suite with SQLite: ``uv run ./scripts/test-sqlite.sh``

-------------------------------------------------------------------------------

Contributing to the docs
------------------------

The docs are written using Sphinx. To get them running locally:

* Install doc dependencies: ``uv sync --group docs``
* ``cd docs``
* Do an initial build of the docs: ``make html``
* Serve the docs: ``uv run ./scripts/run-docs.sh``
* The docs will auto rebuild as you make changes.

-------------------------------------------------------------------------------

Code style
----------

Piccolo uses `Black <https://black.readthedocs.io/en/stable/>`_  for
formatting, preferably with a max line length of 79, to keep it consistent
with `PEP8 <https://python.org/dev/peps/pep-0008/>`_ .

You can configure `VSCode <https://code.visualstudio.com/>`_ by modifying
``settings.json`` as follows:

.. code-block:: json

    {
        "python.linting.enabled": true,
        "python.linting.mypyEnabled": true,
        "python.formatting.provider": "black",
        "python.formatting.blackArgs": [
            "--line-length",
            "79"
        ],
        "editor.formatOnSave": true
    }

Type hints are used throughout the project.

-------------------------------------------------------------------------------

Profiling
---------

This isn't required to contribute to Piccolo, but is useful when investigating
performance problems.

 * Install the dependencies: ``uv sync --group profile``
 * Make sure a Postgres database called ``piccolo_profile`` exists.
 * Run ``./scripts/profile.sh`` to get performance data.
