#include "PlyWriter.h"
#include <fstream>

namespace lego {
	
	namespace ply {

		void write(const char* filename, const std::vector<Building>& buildings) {
			std::map<Point3d, int> vertices_map;
			std::vector<Point3d> vertices;
			std::vector<std::vector<int>> faces;
			for (int i = 0; i < buildings.size(); i++) {
				if (buildings[i].holes.size() == 0) {
					std::vector<int> bottom_face;
					std::vector<int> top_face;
										
					for (int j = 0; j < buildings[i].footprint.size(); j++) {
						Point3d pt_bottom(buildings[i].footprint[j].x, buildings[i].footprint[j].y, buildings[i].bottom_height);
						Point3d pt_top(buildings[i].footprint[j].x, buildings[i].footprint[j].y, buildings[i].top_height);

						int index_bottom;
						if (vertices_map.find(pt_bottom) == vertices_map.end()) {
							index_bottom = vertices.size();
							vertices.push_back(pt_bottom);
							vertices_map[pt_bottom] = index_bottom;
						}
						else {
							index_bottom = vertices_map[pt_bottom];
						}
						bottom_face.push_back(index_bottom);

						int index_top;
						if (vertices_map.find(pt_top) == vertices_map.end()) {
							index_top = vertices.size();
							vertices.push_back(pt_top);
							vertices_map[pt_top] = index_top;
						}
						else {
							index_top = vertices_map[pt_top];
						}
						top_face.push_back(index_top);
					}

					faces.push_back(bottom_face);
					faces.push_back(top_face);

					// side face
					for (int i = 0; i < bottom_face.size(); i++) {
						int next = (i + 1) % bottom_face.size();
						faces.push_back({ bottom_face[i], bottom_face[next], top_face[next], top_face[i] });
					}
				}
				else {
					//std::vector<std::vector<cv::Point2f>> polygons = tessellate(buildings[i].footprint, buildings[i].holes);
				}
			}

			std::ofstream out(filename);
			out << "ply" << std::endl;
			out << "format ascii 1.0" << std::endl;
			out << "element vertex " << vertices.size() << std::endl;
			out << "property double x" << std::endl;
			out << "property double y" << std::endl;
			out << "property double z" << std::endl;
			out << "element face " << faces.size() << std::endl;
			out << "property list uchar int vertex_indices" << std::endl;
			out << "end_header" << std::endl;
			
			// write vertices
			for (int i = 0; i < vertices.size(); i++) {
				out << vertices[i].x << " " << vertices[i].y << " " << vertices[i].z << std::endl;
			}

			// write faces
			for (int i = 0; i < faces.size(); i++) {
				out << faces[i].size();
				for (int j = 0; j < faces[i].size(); j++) {
					out << " " << faces[i][j];
				}
				out << std::endl;
			}

			out.close();
		}

		std::vector<std::vector<cv::Point2f>> tessellate(const std::vector<cv::Point2f>& points, const std::vector<std::vector<cv::Point2f>>& holes) {
			std::vector<std::vector<cv::Point2f>> ans;

			//Insert the polygons into a constrained triangulation
			CDT cdt;
			Polygon_2 polygon;
			for (int j = 0; j < points.size(); j++) {
				polygon.push_back(Point(points[j].x, points[j].y));
			}
			cdt.insert_constraint(polygon.vertices_begin(), polygon.vertices_end(), true);
			for (int i = 0; i < holes.size(); i++) {
				Polygon_2 polygon;
				for (int j = 0; j < holes[i].size(); j++) {
					polygon.push_back(Point(holes[i][j].x, holes[i][j].y));
				}
				cdt.insert_constraint(polygon.vertices_begin(), polygon.vertices_end(), true);
			}

			//Mark facets that are inside the domain bounded by the polygon
			mark_domains(cdt);

			for (CDT::Finite_faces_iterator fit = cdt.finite_faces_begin(); fit != cdt.finite_faces_end(); ++fit) {
				if (fit->info().in_domain()) {
					std::vector<cv::Point2f> polygon;
					for (int i = 0; i < 3; i++) {
						CDT::Vertex_handle vh = fit->vertex(i);
						polygon.push_back(cv::Point2f(vh->point().x(), vh->point().y()));
					}
					ans.push_back(polygon);
				}
			}
		}

		void mark_domains(CDT& ct, CDT::Face_handle start, int index, std::list<CDT::Edge>& border) {
			if (start->info().nesting_level != -1){
				return;
			}
			std::list<CDT::Face_handle> queue;
			queue.push_back(start);
			while (!queue.empty()){
				CDT::Face_handle fh = queue.front();
				queue.pop_front();
				if (fh->info().nesting_level == -1){
					fh->info().nesting_level = index;
					for (int i = 0; i < 3; i++){
						CDT::Edge e(fh, i);
						CDT::Face_handle n = fh->neighbor(i);
						if (n->info().nesting_level == -1){
							if (ct.is_constrained(e)) {
								border.push_back(e);


							}
							else queue.push_back(n);
						}
					}
				}
			}
		}

		//explore set of facets connected with non constrained edges,
		//and attribute to each such set a nesting level.
		//We start from facets incident to the infinite vertex, with a nesting
		//level of 0. Then we recursively consider the non-explored facets incident 
		//to constrained edges bounding the former set and increase the nesting level by 1.
		//Facets in the domain are those with an odd nesting level.
		void mark_domains(CDT& cdt) {
			for (CDT::All_faces_iterator it = cdt.all_faces_begin(); it != cdt.all_faces_end(); ++it){
				it->info().nesting_level = -1;
			}
			std::list<CDT::Edge> border;
			mark_domains(cdt, cdt.infinite_face(), 0, border);
			while (!border.empty()){
				CDT::Edge e = border.front();
				border.pop_front();
				CDT::Face_handle n = e.first->neighbor(e.second);
				if (n->info().nesting_level == -1){
					mark_domains(cdt, n, e.first->info().nesting_level + 1, border);
				}
			}
		}

	}

}