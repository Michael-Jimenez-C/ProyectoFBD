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
        self.consult.current(newindex=0)
        self.consult.place(x=40,y=180,width=170)

        Button(self.master,text="Actualizar",command=lambda: self.__actualizar()).place(x=40,y=240,width=170)
        Button(self.master,text="Aceptar",command=lambda: self.__aceptar()).place(x=40,y=280,width=170)
        #--------------------tabla-------------------------------
        tcontainer=Frame(self.master)
        tcontainer.place(x=250,y=40,width=400,height=400)
        tscontainer=Frame(tcontainer)
        tscontainer.pack(side="left",fill="both",expand=True)
        self.tabla=ttk.Treeview(tscontainer)
        self.tabla.pack(side="top",fill="both",expand=True)
        scv=ttk.Scrollbar(tcontainer)
        scv.pack(side="right",fill="y")
        sch=ttk.Scrollbar(tscontainer,orient="horizontal")
        sch.pack(side="bottom",fill="x")
        self.tabla.config(yscrollcommand=scv.set,xscrollcommand=sch.set)
        scv.config(command=self.tabla.yview)
        sch.config(command=self.tabla.xview)

    def __exportar(self):
        pass
    def __verificar(self):
        pass
    def __subir(self):
        pass
    def __actualizar(self):
        pass
    def __aceptar(self):
        for i in self.tabla.get_children(item=""):
            self.tabla.delete(i)

        cons=Consulta()
        if(self.consult.get()=="Empleados"):
            s=cons.execute(params={"tabla":"empleado","columnas":("id_empleado","nombre_empleado","tipo_documento_empleado","Contrato_id_contrato")})
            print(s)
            id,nombre,DI,IC=s

        headers=["ID","Nombre"]#,"Documento","Contrato"]
        self.tabla.config(columns=headers[0:])
        for i in headers:
            self.tabla.column(i,width=80,anchor=CENTER)
            self.tabla.heading(i,text=i if i!="#0" else headers[0],anchor=CENTER)
        for i in range(len(id)):
            self.tabla.insert("",END,text=id[i],values=[nombre[i],DI[i],IC[i]])
root=Tk()
gui=GUI(root)
root.mainloop()