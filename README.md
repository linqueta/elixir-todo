# Todo

I've used this project to learn some things like IO, Enum, List, Struct, Test, Doctest and others about Elixir.

To use, follow these steps:

1. `mix deps.get`
2. `iex -S mix`
2. `Todo.start()`

Functions:
- List tasks
- Show a task
- Insert a task
- Update a task
- Reset repository
- Exit

Usage:
```shell
▶ iex -S mix
Erlang/OTP 22 [erts-10.6.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe]

Compiling 1 file (.ex)
Interactive Elixir (1.10.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Todo.start
Starting...

 -----------------------------------------------------------------------------------------
|                  id                  |      title      |           description          |
 -----------------------------------------------------------------------------------------
| 49bd8b00-5bf8-11ea-89a2-8c8590985385 | Edit products   | Must be able to edit products  |
| 696b726e-5bf8-11ea-9445-8c8590985385 | Edit availab... | The management want to edit... |
 -----------------------------------------------------------------------------------------

What do you wanna do?
l - List tasks
i - Insert a task
s - Show a task
r - Reset repository
e - Exit
(l|i|s|r|e): s

What is the id?
 id: 696b726e-5bf8-11ea-9445-8c8590985385

 ----------------------------------------------------------------------------------
|      field      |                             value                              |
 ----------------------------------------------------------------------------------
| description     | The management want to edit available product items in a page  |
| id              | 696b726e-5bf8-11ea-9445-8c8590985385                           |
| title           | Edit available product items                                   |
 ----------------------------------------------------------------------------------

What do you wanna do?
l - List tasks
u - Update this task
e - Exit
(l|u|e): u

Updating item:
title: Availabel product item
description: None

 -----------------------------------------------------------------------------------------
|                  id                  |      title      |           description          |
 -----------------------------------------------------------------------------------------
| 49bd8b00-5bf8-11ea-89a2-8c8590985385 | Edit products   | Must be able to edit products  |
| 696b726e-5bf8-11ea-9445-8c8590985385 | Availabel pr... | None                           |
 -----------------------------------------------------------------------------------------

What do you wanna do?
l - List tasks
i - Insert a task
s - Show a task
r - Reset repository
e - Exit
(l|i|s|r|e): i

Creating item:
title: Just a new task
description: I dont wanna write the description

 -----------------------------------------------------------------------------------------
|                  id                  |      title      |           description          |
 -----------------------------------------------------------------------------------------
| 49bd8b00-5bf8-11ea-89a2-8c8590985385 | Edit products   | Must be able to edit products  |
| 696b726e-5bf8-11ea-9445-8c8590985385 | Availabel pr... | None                           |
| 13d47a02-5bf9-11ea-b805-8c8590985385 | Just a new task | I dont wanna write the desc... |
 -----------------------------------------------------------------------------------------

What do you wanna do?
l - List tasks
i - Insert a task
s - Show a task
r - Reset repository
e - Exit
(l|i|s|r|e): r

 -----------------------------------------------------------------------------------------
|                  id                  |      title      |           description          |
 -----------------------------------------------------------------------------------------

What do you wanna do?
l - List tasks
i - Insert a task
s - Show a task
r - Reset repository
e - Exit
(l|i|s|r|e): e
Bye!
:ok
```