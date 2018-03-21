import sys,argparse,os,shutil

def main(args=None):
    
    if args is None:
        args = sys.argv[1:]
    
    parser = argparse.ArgumentParser(description='Building Modeling from vdb')
    
    parser.add_argument('input_vdb', type=str, help='input vdb filename')
    parser.add_argument('input_binary', type=str, help='input binary filename')
    parser.add_argument('weight', type=float, help='The relative weight of accuracy term to the simplicity term [0, 1].')
    parser.add_argument('algorithm', type=int, help='Algorithm: 1 - All, 2 - DP')
    parser.add_argument('output', type=str, help='output ply filename')
    #parser.add_argument('-t', '--threshold', type=float, help='threshold')
    args = parser.parse_args(args)

    # slices_folder name is a temporary fold to store the slice images
    slices_folder = "tmp_slices"

    # create the tmp folder
    if os.path.isdir(slices_folder):
        shutil.rmtree(slices_folder, ignore_errors=True)
    os.mkdir(slices_folder)

    #args.threshold = 0.5
    #if args.threshold is None:
    #    cmd = " ".join(["lego", "vdb.horzSlice", args.input_vdb, "--name", slices_folder + "/slice_%03d.png"])
    #    print(cmd)
    #    os.system(cmd)
    #else:
    cmd = " ".join(["lego", "vdb.horzSlice", args.input_vdb, "--name", slices_folder + "/slice_%03d.png", "--threshold", "0.5"])
    print(cmd)
    os.system(cmd)

    cmd = " ".join(["./" + args.input_binary, slices_folder + "/slice_001.png", str(args.weight), str(args.algorithm), args.output])
    #cmd = " ".join(["./" + args.input_binary, slices_folder + "/slice_000.png"])
    print(cmd)
    os.system(cmd)

    # remove the temporary folder
    if os.path.isdir(slices_folder):
        shutil.rmtree(slices_folder, ignore_errors=True)


if __name__ == "__main__":
    main()
