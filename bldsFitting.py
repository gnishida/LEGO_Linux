import sys,argparse,os,shutil

def main(args=None):
    
    if args is None:
        args = sys.argv[1:]
    
    parser = argparse.ArgumentParser(description='Building Modeling from vdb')
    
    parser.add_argument('input_vdb', type=str, help='input vdb filename')
    parser.add_argument('input_binary', type=str, help='input binary filename')
    parser.add_argument('weight', type=float, help='The relative weight of accuracy term to the simplicity term [0, 1].')
    parser.add_argument('algorithm', type=int, help='Algorithm: 1 - All, 2 - DP')
    parser.add_argument('offset_x', type=float, help='offset x')
    parser.add_argument('offset_y', type=float, help='offset y')
    parser.add_argument('offset_z', type=float, help='offset z')
    parser.add_argument('scale', type=float, help='scale')
    parser.add_argument('output_obj', type=str, help='output obj filename')
    parser.add_argument('output_topface', type=str, help='output topface filename')
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
    cmd = " ".join(["lego vdb horzSlice", args.input_vdb, "--name", slices_folder + "/slice_%03d.png", "--threshold", "0.5"])
    print(cmd)
    os.system(cmd)

    cmd = " ".join(["./" + args.input_binary, slices_folder + "/slice_001.png", str(args.weight), str(args.algorithm), str(args.offset_x), str(args.offset_y), str(args.offset_z), str(args.scale), args.output_obj, args.output_topface])
    #cmd = " ".join(["./" + args.input_binary, slices_folder + "/slice_000.png"])
    print(cmd)
    os.system(cmd)

    # remove the temporary folder
    if os.path.isdir(slices_folder):
        shutil.rmtree(slices_folder, ignore_errors=True)


if __name__ == "__main__":
    main()
