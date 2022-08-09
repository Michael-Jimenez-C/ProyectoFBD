from tkinter import *
from tkinter import ttk
from turtle import width
from command.Comandos import *

class GUI:
    def __init__(self, master):
        self.master=master
        self.bg="#ADADAD"
        self.master.geometry("700x600")
        self.master.title("Meicol-Finanzas")
        self.master.resizable(False,False)
        self.master.config(bg=self.bg)
        self.__widgets()
    def __widgets(self):
        #---------------------menubar----------------------------
        menu=Menu(self.master)
        menudesplegable=Menu(self.master)
        menudesplegable.add_command(label="Exportar", command=lambda :self.__exportar())
        menudesplegable.add_command(label="Verificar Integridad", command=lambda :self.__verificar())
        menudesplegable.add_command(label="Subir", command=lambda :self.__subir())
        menu.add_cascade(label="Archivo",menu=menudesplegable)
        self.master.config(menu=menu)
        #--------------------parametros de seleccion-------------
        Label(self.master,text="Desde",bg=self.bg,fg="#FFF").place(x=40,y=100)
        self.fecha1=Entry(self.master,width=10)
        self.fecha1.place(x=40,y=120)

        Label(self.master,text="Hasta",bg=self.bg,fg="#FFF").place(x=140,y=100)
        self.fecha2=Entry(self.master,width=10)
        self.fecha2.place(x=140,y=120)

        Label(self.master,text="consulta",bg=self.bg,fg="#FFF").place(x=40,y=160)
        self.consult=ttk.Combobox(self.master,values=["Empleados","Contratados ext","Costos","Gastos"],state="readonly")
        self.consult.place(x=40,y=180,width=170)


        Button(self.master,text="Actualizar",command=lambda: self.__actualizar()).place(x=40,y=240,width=170)
        Button(self.master,text="Aceptar",command=lambda: self.__aceptar()).place(x=40,y=280,width=170)
        #--------------------tabla-------------------------------
    def __exportar(self):
        print("exportar")
    def __verificar(self):
        print("verificar")
    def __subir(self):
        print("verificar")


root=Tk()
gui=GUI(root)
root.mainloop()