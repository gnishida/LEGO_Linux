#include "BuildingSimplification.h"
#include "OpenCVSimplification.h"
#include "ContourUtils.h"
#include "LayerVoxelData.h"
#include "OpenCVSimplification.h"
#include "OurCustomSimplification.h"

namespace simp {

	BuildingSimplification::BuildingSimplification(const std::vector<std::vector<cv::Mat_<uchar>>>& disjointed_voxel_data, float layering_threshold, float snap_vertex_threshold, float snap_edge_threshold) {
		this->disjointed_voxel_data = disjointed_voxel_data;
		if (disjointed_voxel_data.size() > 0 && disjointed_voxel_data[0].size() > 0) {
			this->size = cv::Size(disjointed_voxel_data[0][0].cols, disjointed_voxel_data[0][0].rows);
		}
		this->layering_threshold = layering_threshold;
		this->snap_vertex_threshold = snap_vertex_threshold;
		this->snap_edge_threshold = snap_edge_threshold;
	}

	/**
	* Simplify all the buildings.
	*
	* @param epsilon	simplification level
	* @return			simplified buildings
	*/
	std::vector<std::shared_ptr<Building>> BuildingSimplification::simplifyBuildingsByOpenCV(float epsilon) {
		std::vector<std::shared_ptr<Building>> buildings;

		for (int i = 0; i < disjointed_voxel_data.size(); i++) {
			try {
				util::LayerVoxelData lvd(disjointed_voxel_data[i], 0.5);
				std::shared_ptr<util::Layer> layer = lvd.layering(layering_threshold);
			
				std::shared_ptr<Building> building = simplifyBuildingByOpenCV(layer, epsilon);
				buildings.push_back(building);
			}
			catch (...) {
			}
		}

		return buildings;
	}

	/**
	 * Simplify all the buildings.
	 *
	 * @param resolution	simplification level
	 * @return				simplified buildings
	 */
	std::vector<std::shared_ptr<Building>> BuildingSimplification::simplifyBuildingsByOurCustom(int resolution) {
		std::vector<std::shared_ptr<Building>> buildings;

		for (int i = 0; i < disjointed_voxel_data.size(); i++) {
			try {
				util::LayerVoxelData lvd(disjointed_voxel_data[i], 0.5);
				std::shared_ptr<util::Layer> layer = lvd.layering(layering_threshold);

				double angle = -1;
				int dx = -1;
				int dy = -1;
				std::shared_ptr<Building> building = simplifyBuildingByOurCustom(layer, resolution, angle, dx, dy);
				buildings.push_back(building);
			}
			catch (...) {
			}
		}

		return buildings;
	}

	/**
	 * Simplify the shape of a building.
	 *
	 * @param layer		layer
	 * @param epsilon	simplification level
	 * @return			simplified building shape
	 */
	std::shared_ptr<Building> BuildingSimplification::simplifyBuildingByOpenCV(std::shared_ptr<util::Layer> layer, float epsilon) {
		std::vector<util::Polygon> polygons = util::findContours(layer->slices[0]);

		if (polygons.size() == 0) throw "No building voxel is found in this layer.";

		int slice_id = selectRepresentativeSlice(layer->slices);
		util::Polygon simplified_polygon = OpenCVSimplification::simplify(layer->slices[slice_id], epsilon);
		cv::Mat_<float> mat = (cv::Mat_<float>(2, 3) << 1, 0, -size.width / 2, 0, -1, size.height / 2);
		simplified_polygon.transform(mat);
		std::shared_ptr<Building> building = std::shared_ptr<Building>(new Building(simplified_polygon, layer->bottom_height, layer->top_height));

		for (int i = 0; i < layer->children.size(); i++) {
			try {
				std::shared_ptr<Building> child = simplifyBuildingByOpenCV(layer->children[i], epsilon);
				util::snapPolygon(building->footprint.contour, child->footprint.contour, snap_vertex_threshold, snap_edge_threshold);
				building->children.push_back(child);
			}
			catch (...) {
			}
		}

		return building;
	}

	/**
	 * Simplify the shape of a building.
	 *
	 * @param layer			layer
	 * @param resolution	simplification level
	 * @return				simplified building shape
	 */
	std::shared_ptr<Building> BuildingSimplification::simplifyBuildingByOurCustom(std::shared_ptr<util::Layer> layer, int resolution, double angle, int dx, int dy) {
		std::vector<util::Polygon> polygons = util::findContours(layer->slices[0]);

		if (polygons.size() == 0) throw "No building voxel is found in this layer.";

		int slice_id = selectRepresentativeSlice(layer->slices);
		util::Polygon simplified_polygon = OurCustomSimplification::simplify(layer->slices[slice_id], resolution, angle, dx, dy);
		cv::Mat_<float> mat = (cv::Mat_<float>(2, 3) << 1, 0, -size.width / 2, 0, -1, size.height / 2);
		simplified_polygon.transform(mat);
		std::shared_ptr<Building> building = std::shared_ptr<Building>(new Building(simplified_polygon, layer->bottom_height, layer->top_height));

		for (int i = 0; i < layer->children.size(); i++) {
			try {
				std::shared_ptr<Building> child = simplifyBuildingByOurCustom(layer->children[i], resolution, angle, dx, dy);
				util::snapPolygon(building->footprint.contour, child->footprint.contour, snap_vertex_threshold, snap_edge_threshold);
				building->children.push_back(child);
			}
			catch (...) {
			}
		}

		return building;
	}

	/**
	 * Select the representative slice that has the best IOU with all the slices in the layer.
	 */
	int BuildingSimplification::selectRepresentativeSlice(const std::vector<cv::Mat>& slices) {
		double best_iou = 0;
		int best_slice = -1;
		for (int i = 0; i < slices.size(); i++) {
			double iou = 0;
			for (int j = 0; j < slices.size(); j++) {
				// calculate IOU
				iou += util::calculateIOU(slices[i], slices[j]);
			}

			if (iou > best_iou) {
				best_iou = iou;
				best_slice = i;
			}
		}

		return best_slice;
	}

}