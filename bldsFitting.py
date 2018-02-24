import sys,argparse,os

def main(args=None):
    
    if args is None:
        args = sys.argv[1:]
    
    parser = argparse.ArgumentParser(description='Building Modeling from vdb')
    
    parser.add_argument('input_vdb', type=str, requried=True, help='input vdb filename')
    parser.add_argument('input_binary', type=str, requried=True, help='input binary filename')
    parser.add_argument('output', type=str, requried=True, help='output ply filename')
    #parser.add_argument('-t', '--threshold', type=float, help='threshold')
    parser.add_argument('-w', '--weight', type=float, requried=True, help='The relative weight of accuracy term to the simplicity term [0, 1].')
    args = parser.parse_args(args)

    # slices_folder name is a temporary fold to store the slice images
    slices_folder = "tmp_slices"

    # create the tmp folder
    # remove the temporary folder
    cmd = " ".join(["mkdir", slices_folder])
    print(cmd)
    os.system(cmd)
    #args.threshold = 0.5
    #if args.threshold is None:
    #    cmd = " ".join(["lego", "vdb.horzSlice", args.input_vdb, "--name", slices_folder + "/slice_%03d.png"])
    #    print(cmd)
    #    os.system(cmd)
    #else:
    cmd = " ".join(["lego", "vdb.horzSlice", args.input_vdb, "--name", slices_folder + "/slice_%03d.png",
                        "--threshold", "0.5"])
    print(cmd)
    os.system(cmd)

    cmd = " ".join(["./" + args.input_binary, slices_folder + "/slice_001.png", str(arg.weight), args.output])
    #cmd = " ".join(["./" + args.input_binary, slices_folder + "/slice_000.png"])
    print(cmd)
    os.system(cmd)

    # remove the temporary folder
    cmd = " ".join(["rm -r", slices_folder])
    print(cmd)
    #os.system(cmd)


if __name__ == "__main__":
    main()
