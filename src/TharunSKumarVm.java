
import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;

public class TharunSKumarVm {
   static PrintWriter Asmfile;


// TharunSKumarVm() throws IOException{
//
//        FileWriter fileWriter = new FileWriter("StaticsTest.asm");
//        Asmfile = new PrintWriter(fileWriter);
//
//    }
    public void ADD() throws IOException {
        Asmfile.println("""
                       //add
                       @SP
                       AM=M-1
                       D=M
                       A=A-1
                       M=D+M
                       """);

    }

    public void SUB() throws IOException {
        Asmfile.println("""
                 //sub
                @SP
                AM=M-1
                D=M
                A=A-1
                M=M-D
                              
                """);
    }

    public void AND() throws IOException {
        Asmfile.println("""
                 //And
                @SP
                 AM=M-1
                 D=M
                 A=A-1
                 M=D&M
                               
                             
                       
                """);
    }

    public void NEG() throws IOException {
        Asmfile.println("""
                 //Neg
                @SP
                A=M-1
                 M=-M
                """);
    }

    public void OR() throws IOException {
        Asmfile.println("""
                 //or
                @SP
                 AM=M-1
                  D=M
                 A=A-1 
                 M=D|M
                                
                            
                """);
    }

    public void NOT() throws IOException {
        Asmfile.println("""
                 //Not
                @SP
                A=M-1
                M=!M
                """);
    }

    public void PUSH() throws IOException {
        Asmfile.println("""
                @SP
                A=M
                M=D
                @SP
                M=M+1
                """);
    }

    public void POP() throws IOException {
        Asmfile.println("""
                @R13
                 M=D
                 @SP
                  AM=M-1
                  D=M
                   @R13
                   A=M
                    M=D
                """);
    }

    public String[] parts;
    int count = 0;

    private String funcName;
    static String currFileName;


    public void Translate(String input) throws IOException {

        parts = input.split(" ");


        if (parts[0].compareTo("add") == 0) {
            ADD();
        } else if (parts[0].compareTo("sub") == 0) {
            SUB();
        } else if (parts[0].compareTo("neg") == 0) {
            NEG();
        } else if (parts[0].compareTo("or") == 0) {
            OR();
        } else if (parts[0].compareTo("and") == 0) {
            AND();
        } else if (parts[0].compareTo("not") == 0) {
            NOT();
        } else if (parts[0].compareTo("push") == 0) {
            push(parts);
        } else if (parts[0].compareTo("pop") == 0) {
            pop(parts);
        } else if (parts[0].compareTo("gt") == 0) {
            count++;
            Asmfile.println("//gt\n"+
                    "@SP\n" +
                    "AM=M-1\n" +
                    "D=M\n" +
                    "A=A-1\n" +
                    "D=M-D\n" +
                    "@GT.true." + count + "\n" +
                    "\nD;JGT\n" +
                    "@SP\n" +
                    "A=M-1\n" +
                    "M=0\n" +
                    "@GT.after." + count + "\n" +
                    "0;JMP\n" +
                    "(GT.true." + count + ")\n" +
                    "@SP\n" +
                    "A=M-1\n" +
                    "M=-1\n" +
                    "(GT.after." + count + ")\n");


        } else if (parts[0].compareTo("lt") == 0) {
            count++;
            Asmfile.println("//lt\n"+
                    "@SP\n" +
                    "AM=M-1\n" +
                    "D=M\n" +
                    "A=A-1\n" +
                    "D=M-D\n" +
                    "@LT.true." + count+ "\n" +
                    "D;JLT\n" +
                    "@SP\n" +
                    "A=M-1\n" +
                    "M=0\n" +
                    "@LT.after." + count + "\n" +
                    "0;JMP\n" +
                    "(LT.true." + count + ")\n" +
                    "@SP\n" +
                    "A=M-1\n" +
                    "M=-1\n" +
                    "(LT.after." + count + ")\n");



        } else if (parts[0].compareTo("eq") == 0) {
            count++;
            Asmfile.println("//eq\n"+
                    "@SP\n" +
                    "AM=M-1\n" +
                    "D=M\n" +
                    "A=A-1\n" +
                    "D=M-D\n" +
                    "@EQ.true." + count + "\n" +
                    "D;JEQ\n" +
                    "@SP\n" +
                    "A=M-1\n" +
                    "M=0\n" +
                    "@EQ.after." + count + "\n" +
                    "0;JMP\n" +
                    "(EQ.true." + count + ")\n" +
                    "@SP\n" +
                    "A=M-1\n" +
                    "M=-1\n" +
                    "(EQ.after." + count + ")\n");



        }
        else if (parts[0].compareTo("label") == 0)
        {
            String label=parts[1];
            Asmfile.println("(" + funcName + "$" + label + ")\n");

        }
        else if(parts[0].compareTo("if-goto") == 0){
            String label = parts[1];
            Asmfile.println("@SP\n" +
                    "AM=M-1\n" +
                    "D=M\n" +
                    "@" + funcName + "$" + label + "\n" +
                    "D;JNE\n");

        }
        else if (parts[0].compareTo("goto") == 0) {
            String label = parts[1];
            Asmfile.println( "@" + funcName + "$" + label + "\n" +
            "0;JMP\n");
        }
        else if (parts[0].compareTo("return") == 0)
        {
            RETURN();

        }
        else if (parts[0].compareTo("function") == 0)
        {
             funcName = parts[1];

//            String s=funcName.substring(funcName.indexOf('.'));
//           if(s.equals(".get") || s.equals(".set"))
//           {
//               currFileName=funcName.replaceAll(s,".vm");
//           }
            FUNCTION(parts[1],parts[2]);
        }
        else if (parts[0].compareTo("call") == 0)
        {
            // String funcName = parts[1];
            CALL(parts[1],parts[2]);
        }
    }

    public void push(String[] parts) throws IOException {

        if (parts.length == 3 && parts[0].compareTo("push") == 0) {
            String n = parts[2];
            if (parts[1].compareTo("local") == 0) {
                Asmfile.println("//push local "+n  + "\n@LCL"  + "\nD=M"+ "\n@"+n+
                         "\nA=D+A"+"\nD=M\n");
                PUSH();
            } else if (parts[1].compareTo("argument") == 0) {
                Asmfile.println("//push argument "+n+ "\n@ARG"  + "\nD=M"+ "\n@"+n+
                        "\nA=D+A"+"\nD=M\n");
                PUSH();
            } else if (parts[1].compareTo("that") == 0) {
                Asmfile.println("//push that "+n+ "\n@THAT"  + "\nD=M"+ "\n@"+n+
                        "\nA=D+A"+"\nD=M\n");
                PUSH();
            } else if (parts[1].compareTo("this") == 0) {
                Asmfile.println("//push this "+n + "\n@THIS"  + "\nD=M"+ "\n@"+n+
                        "\nA=D+A"+"\nD=M\n");
                PUSH();
            } else if (parts[1].compareTo("pointer") == 0) {
                if (n.contains("0") ){
                    Asmfile.println("//push pointer 0");
                    Asmfile.println("@THIS");
                    Asmfile.println("D=M");
                    PUSH();
                } else if (n.contains("1")) {
                    Asmfile.println("//push pointer 1");
                    Asmfile.println("@THAT");
                    Asmfile.println("D=M");
                    PUSH();
                }
            } else if (parts[1].compareTo("constant") == 0) {
                Asmfile.println("//push constant "+n);
                Asmfile.println("@" + n);
                Asmfile.println("D=A");
                PUSH();
            } else if (parts[1].compareTo("temp") == 0) {
                Asmfile.println(
                        "//push temp"+n+
                        "@R5"+
                        "D=A"+
                        "@"+n +
                       " A=D+A"+
                       " D=M");
                PUSH();
            } else if (parts[1].compareTo("static") == 0) {

                Asmfile.println("@" + currFileName + "."+n+"\n"
                        +"D=M\n"
                       );
                PUSH();


            }
        }
    }

    public void pop(String[] parts) throws IOException {
        if (parts.length == 3 && parts[0].compareTo("pop") == 0) {
            String n = parts[2];
            if (parts[1].compareTo("local") == 0) {
                Asmfile.println("//pop local " +n+ "\n@LCL" + "\nD=M" +"\n@"+n
                        + "\nD=D+A\n");
                POP();
            } else if (parts[1].compareTo("argument") == 0) {
                Asmfile.println("//pop argument " +n+  "\n@ARG" + "\nD=M" +"\n@"+n
                        + "\nD=D+A\n");
                POP();
            } else if (parts[1].compareTo("this") == 0) {
                Asmfile.println("//pop this " +n+  "\n@THIS" + "\nD=M" +"\n@"+n
                        + "\nD=D+A\n");
                POP();
            } else if (parts[1].compareTo("that") == 0) {
                Asmfile.println("//pop that " +n+  "\n@THAT" + "\nD=M" +"\n@"+n
                        + "\nD=D+A\n");
                POP();
            } else if (parts[1].compareTo("static") == 0) {
                Asmfile.println("@"+  currFileName+"."+n+"\n"
                        +"D=A\n");
                POP();

            } else if (parts[1].compareTo("pointer") == 0) {
                if (n.contains("0")) {
                    Asmfile.println(
                            "//pop pointer 0 \n"+
                             "@THIS\n"+
                            "D=A\n");
                    POP();
                } else if (n.contains("1")) {
                    Asmfile.println(
                            "//pop pointer 1\n"+
                            "@THAT\n"+
                                    "D=A\n");
                    POP();
                }


            } else if (parts[1].compareTo("temp") == 0) {
                Asmfile.println("//pop temp"+n+" \n"+"@R5" + " \n"
                        + "D=A \n"
                        + "@ "+n+"\n"
                        + "D=D+A \n");
                POP();
            }
        }
    }
    public void FUNCTION(String f, String k) {
        String s =
                ("(" + f + ")\n" +
                        "@SP\n" +
                        "A=M\n");
        int kk = Integer.parseInt(k);
        for (int i = 0; i < kk; i += 1) {
            s+=("""
                    M=0
                    A=A+1
                    """);
        }
        Asmfile.println( s);
        Asmfile.println(  "D=A");
        Asmfile.println(   "@SP");
        Asmfile.println(   "M=D");





    }

    public   void CALL(String f , String n)
    {
        count++;
             Asmfile.println("  // SP -> R13\n"+
                     "@SP\n" +
                             "D=M\n" +
                             "@R13\n" +
                             "M=D\n" +
                             "// @RET -> *SP\n"+
                             "@RET." + count + "\n" +
                             "D=A\n" +
                             "@SP\n" +
                             "A=M\n" +
                             "M=D\n" +
                             "// SP++\n"+
                             "@SP\n" +
                             "M=M+1\n" +
                             "// LCL -> *SP\n"+
                             "@LCL\n" +
                             "D=M\n" +
                             "@SP\n" +
                             "A=M\n" +
                             "M=D\n" +
                             "// SP++\n"+
                             "@SP\n" +
                             "M=M+1\n" +
                            " // ARG -> *SP\n"+
                             "@ARG\n" +
                             "D=M\n" +
                             "@SP\n" +
                             "A=M\n" +
                             "M=D\n" +
                            " // SP++\n"+
                             "@SP\n" +
                             "M=M+1\n" +
                            " // THIS -> *SP\n"+
                             "@THIS\n" +
                             "D=M\n" +
                             "@SP\n" +
                             "A=M\n" +
                             "M=D\n" +
                            " // SP++\n"+
                             "@SP\n" +
                             "M=M+1\n" +
                             "// THAT -> *SP\n"+
                             "@THAT\n" +
                             "D=M\n" +
                             "@SP\n" +
                             "A=M\n" +
                             "M=D\n" +
                             "// SP++\n"+
                             "@SP\n" +
                             "M=M+1\n" +
                             "// R13 - n -> ARG\n"+
                             "@R13\n" +
                             "D=M\n" +
                             "@" + n + "\n" +
                             "D=D-A\n" +
                             "@ARG\n" +
                             "M=D\n" +
                             "// SP -> LCL\n"+
                             "@SP\n" +
                             "D=M\n" +
                             "@LCL\n" +
                             "M=D\n" +
                             "@" + f + "\n" +
                             "0;JMP\n" +
                             "(RET." + count + ")\n"
        );


    }
    public void RETURN()
    {
        Asmfile.println(
            "//RETURN\n"+
            "// *(LCL - 5) -> R13\n"+
                    "@LCL\n" +
                    "D=M\n" +
                    "@5\n" +
                    "A=D-A\n" +
                    "D=M\n" +
                    "@R13\n" +
                    "M=D\n" +
                    "// *(SP - 1) -> *ARG\n"+
                    "@SP\n" +
                    "A=M-1\n" +
                    "D=M\n" +
                    "@ARG\n" +
                    "A=M\n" +
                    "M=D \n" +
                    "// ARG + 1 -> SP\n"+
                    "D=A+1\n" +
                    "@SP\n" +
                    "M=D\n" +
                    "// *(LCL - 1) -> THAT; LCL--\n"+
                    "@LCL\n" +
                    "AM=M-1\n" +
                    "D=M\n" +
                    "@THAT\n" +
                    "M=D\n" +
                   " // *(LCL - 1) -> THIS; LCL--\n"+
                    "@LCL\n" +
                    "AM=M-1\n" +
                    "D=M\n" +
                    "@THIS\n" +
                    "M=D\n" +
                    "// *(LCL - 1) -> ARG; LCL--\n"+
                    "@LCL\n" +
                    "AM=M-1\n" +
                    "D=M\n" +
                    "@ARG\n" +
                    "M=D\n" +
                   " // *(LCL - 1) -> LCL\n"+
                    "@LCL\n" +
                    "A=M-1\n" +
                    "D=M\n" +
                    "@LCL\n" +
                    "M=D\n" +
                    "// R13 -> A\n"+
                    "@R13\n" +
                    "A=M\n" +
                    "0;JMP\n");

    }

    public void bootstrap()
    {
        Asmfile.println(
                "@256\n" +
                        "D=A\n" +
                        "@SP\n" +
                        "M=D\n" +
                        "// call Sys.init 0\n" );
        CALL("Sys.init", "0") ;
        Asmfile.println("0;JMP\n");
    }
    public static void main(String[] args) {

        try {

            TharunSKumarVm a = new TharunSKumarVm();
            BufferedReader br =new BufferedReader(new InputStreamReader(System.in));
            System.out.println("Enter the directory location");
            String dir=br.readLine();
            System.out.println("Enter the location of the output file");
            String loc=br.readLine();

            File directoryPath = new File(dir);
            System.out.println(directoryPath.getName());
            File filesList[] = directoryPath.listFiles();


            ArrayList<File> vmfile=new ArrayList<File>();
            int vmcount=0;

            System.out.println("List of files and directories in the specified directory:");
            for(File file : filesList) {
                System.out.println("File name: "+file.getName());
                System.out.println("File path: "+file.getAbsolutePath());

                String in=file.getName();
                String extension=in.substring(in.lastIndexOf('.')+1);

                if(extension.equals("vm")) {
                    vmfile.add(file);
                    vmcount++;
                }
            }
            if(vmcount>1){
                int count=0;

                Asmfile = new PrintWriter(loc);

               a.bootstrap();

                while(count<vmcount) {
                    File f=new File(vmfile.get(count).getAbsolutePath());
                    Scanner op=new Scanner(f);
                    currFileName=vmfile.get(count).getName();
                    while(op.hasNextLine()) {
                        String line=op.nextLine();
                        line = line.replaceAll("//.*", "").trim();
                        a.Translate(line);
                    }
                    op.close();

                    count+=1;
                }

                Asmfile.close();
            }
            else{
                File f=new File(vmfile.get(0).getAbsolutePath());
                Scanner op=new Scanner(f);

                Asmfile = new PrintWriter(loc);

                currFileName=vmfile.get(0).getName();
                while(op.hasNextLine()) {
                    String line=op.nextLine();
                    line = line.replaceAll("//.*", "").trim();
                    a.Translate(line);

                }
                op.close();

                Asmfile.close();
            }


        } catch (IOException f) {
            System.out.println("Couldn't Find file");
        }
        }

    }



