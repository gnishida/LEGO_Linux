#include <iostream>
#include "OpenCVSimplification.h"
#include <QDir>
#include <QString>
#include "PlyWriter.h"

int main(int argc, const char* argv[]) {
	if (argc < 3) {
		std::cerr << "Usage: " << argv[0] << " <slice image filename> <output filename>" << std::endl;
		return -1;
	}

	QString input_filename(argv[1]);
	std::vector<cv::Mat> voxel_data;

	// get directory
	QFileInfo finfo(input_filename);
	if (!finfo.exists()) {
		std::cerr << "Input file was not found: " << argv[1] << std::endl;
		return -1;
	}
	QDir dir = finfo.absoluteDir();

	// scan all the files in the directory to get a voxel data
	QStringList files = dir.entryList(QDir::NoDotAndDotDot | QDir::Files, QDir::DirsFirst);
	voxel_data.resize(files.size());
	for (int i = 0; i < files.size(); i++) {
		voxel_data[i] = cv::imread((dir.absolutePath() + "/" + files[i]).toUtf8().constData(), cv::IMREAD_GRAYSCALE);
	}

	std::vector<simp::Building> buildings;

	simp::OpenCVSimplification sim(voxel_data, 1, 0.7, 1, 0.5);
	sim.simplify(buildings);

	buildings.clear();
	buildings.resize(1);
	buildings[0].bottom_height = 0;
	buildings[0].top_height = 8;
	buildings[0].footprint.resize(4);
	buildings[0].footprint[0] = cv::Point2f(0, 0);
	buildings[0].footprint[1] = cv::Point2f(8, 0);
	buildings[0].footprint[2] = cv::Point2f(8, 8);
	buildings[0].footprint[3] = cv::Point2f(0, 8);
	buildings[0].holes.clear();

	util::ply::PlyWriter::write(argv[2], buildings);

	std::cout << buildings.size() << " buildings are generated." << std::endl;

	return 0;
}