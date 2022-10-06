'''
Takes file as argument
'''

import argparse

def process(file, striptodo=False):
    #print("processing: {}".format(file))
    #dir(file)
    for line in file.read().splitlines():
        
        if line[0:2] == '//':
            if striptodo==False:
                #line = "\\fbox{" + line + "}"
                line = line.replace('^', '\\^')
                line = line.replace('_', '\\_')
                line = line.replace('&', '\\&')

                line = "\\noindent\\fbox{%\n\\parbox{\\textwidth}{\n" + line + "\n}\n}"
            else:
                line =""

        if line[0:2] == '##':
            print("\\newpage\n")

        print(line)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
                        description='''
                        MfH preprocessor
                        ''',
                        epilog=''
                        )
    parser.add_argument(
                        '-f', '--file',
                        type=argparse.FileType('r'),
                        help='File to be processed'
                        )
    parser.add_argument(
                        '-s', '--striptodo',
                        type=bool,
                        nargs='?',
                        const=True, 
                        default=False,
                        help='Strip todo'
                        )
    
    args = parser.parse_args()
    
    if args.file is not None:
        process(args.file, args.striptodo)
    #main(args.source)
    #test()
