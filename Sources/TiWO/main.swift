let inputReader = MenuInputReader()
let inputMapper = MenuInputMapper()
let executer = MenuOptionExecuter()

let menu = Menu(inputReader: inputReader, inputMapper: inputMapper, executer: executer)
menu.run()
